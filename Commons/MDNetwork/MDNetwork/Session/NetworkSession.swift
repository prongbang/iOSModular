//
//  NetworkSession.swift
//  MDNetwork
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Foundation
import Alamofire
import Moya
import MDFactory

public class NetworkSession: Alamofire.Session {
    
    public override init(session: URLSession, delegate: SessionDelegate, rootQueue: DispatchQueue, startRequestsImmediately: Bool = true, requestQueue: DispatchQueue? = nil, serializationQueue: DispatchQueue? = nil, interceptor: (any RequestInterceptor)? = nil, serverTrustManager: ServerTrustManager? = nil, redirectHandler: (any RedirectHandler)? = nil, cachedResponseHandler: (any CachedResponseHandler)? = nil, eventMonitors: [any EventMonitor] = [AlamofireNotifications()]) {
        super.init(session: session, delegate: delegate, rootQueue: rootQueue)
    }
    
    static func instance <Target: TargetNetwork> (service: Target, evaluators: [String: ServerTrustEvaluating]) -> NetworkSession {
        let serverTrustManager = ServerTrustManager(evaluators: evaluators)
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = service.timeout
        configuration.timeoutIntervalForResource = service.timeout
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        return NetworkSession(configuration: configuration, serverTrustManager: serverTrustManager)
    }
}
