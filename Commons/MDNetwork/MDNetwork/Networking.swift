//
//  Networking.swift
//  MDNetwork
//
//  Created by prongbang on 26/10/2567 BE.
//

import Foundation
import Moya
import Alamofire
import PromiseKit
import MDFactory

public class Networking: Network {

    private let sessionManager: NetworkSessionManager
    private let defaultEndpoint: NetworkEndpointManager
    
    public init(sessionManager: NetworkSessionManager, defaultEndpoint: NetworkEndpointManager) {
        self.sessionManager = sessionManager
        self.defaultEndpoint = defaultEndpoint
    }
    
    class var serverTrustEvaluators: [String: ServerTrustEvaluating] {
        let list: [String: ServerTrustEvaluating] = [
            "wachasit.com": PublicKeysTrustEvaluator(
                keys: Bundle.main.af.publicKeys,
                performDefaultValidation: true,
                validateHost: true
            ),
        ]
        return list
    }
    
    public func requester<Target: TargetNetwork>(
        service: Target,
        retryCount: Int,
        completion: @escaping Moya.Completion
    ) -> any Moya.Cancellable where Target : Moya.TargetType, Target : NetworkTargetType {
        
        let session = sessionManager.build(service: service, evaluators: Networking.serverTrustEvaluators)
        let endpointClosure = defaultEndpoint.endpoint(service: service)
        let provider = MoyaProvider<Target>(endpointClosure: endpointClosure, session: session, plugins: defaultPlugins)
        
        return provider.request(service, completion: completion)
    }
    
    public func requester<Target: TargetNetwork>(service: Target, retryCount: Int) -> (Promise<Moya.Response>, Moya.Cancellable) {
        let (promise, seal) = Promise<Moya.Response>.pending()
        
        let cancellable = requester(service: service, retryCount: retryCount) { result in
            switch result {
            case .success(let response):
                seal.fulfill(response)
            case .failure(let error):
                seal.reject(error)
            }
        }
        
        return (promise, cancellable)
    }
    
    public func requester<Target: TargetNetwork>(service: Target) -> (Promise<Moya.Response>, Moya.Cancellable) {
        
        return requester(service: service, retryCount: 1)
    }
    
    public func requester<Target: TargetNetwork, R: Codable>(service: Target) -> (Promise<Results<R>>, Moya.Cancellable) {
        let (promise, cancellable) = requester(service: service, retryCount: 1)
        
        return (handleResponse(promise: promise), cancellable)
    }
    
    private func handleResponse<T: Codable>(promise: Promise<Moya.Response>) -> Promise<Results<T>> {
        return Promise<Results<T>> { seal in
            promise.done { response in
                do {
                    // Check for successful status codes
                    try _ = response.filter(statusCodes: 200...201)
                    let items = try response.map(T.self)
                    seal.fulfill(.success(items))
                } catch {
                    // Handle specific status codes
                    seal.fulfill(self.handleError(response: response, error: error))
                }
            }.catch { error in
                seal.reject(error)
            }
        }
    }
    
    private func handleError<T>(response: Response, error: Error) -> Results<T> {
        switch response.statusCode {
        case 204: // No Content
            return .noContent
        case 400: // Bad Request
            return .badRequest
        case 401: // Unauthorized
            return .unauthorized
        default:
            return .failure(error.localizedDescription)
        }
    }
    
}
