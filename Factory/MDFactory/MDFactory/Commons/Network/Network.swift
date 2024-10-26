//
//  Network.swift
//  MDFactory
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//


import Foundation
import Alamofire
import Moya
import PromiseKit

public typealias NetworkResult = Swift.Result<Moya.Response, MoyaError>
public typealias TargetNetwork = TargetType & NetworkTargetType

public protocol NetworkTargetType {
    var timeout: TimeInterval { get }
    var parameters: [String: Any]? { get }
    var validate: Bool { get }
}

public enum Results<T: Codable> {
    case success(T)
    case noContent
    case badRequest
    case unauthorized
    case failure(String)
    
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .noContent, .badRequest, .unauthorized, .failure:
            return false
        }
    }
}

public protocol Network {
    
    func requester<Target: TargetNetwork>(
        service: Target,
        retryCount: Int,
        completion: @escaping Moya.Completion
    ) -> Cancellable
    
    func requester<Target: TargetNetwork>(service: Target, retryCount: Int) -> (Promise<Moya.Response>, Cancellable)
    
    func requester<Target: TargetNetwork>(service: Target) -> (Promise<Moya.Response>, Cancellable)
    
    func requester<Target: TargetNetwork, R: Codable>(service: Target) -> (Promise<Results<R>>, Cancellable)
}
