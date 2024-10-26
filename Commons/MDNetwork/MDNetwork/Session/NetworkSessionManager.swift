//
//  NetworkSessionBuilder.swift
//  MDNetwork
//
//  Created by prongbang on 26/10/2567 BE.
//

import Foundation
import Alamofire
import Moya
import MDFactory

public protocol NetworkSessionManager {
    func build<Target: TargetNetwork>(service: Target, evaluators: [String: ServerTrustEvaluating]) -> NetworkSession
}

public class NetworkSessionManagerLogic: NetworkSessionManager {
    
    public init() {}
    
    public func build<Target: TargetNetwork>(service: Target, evaluators: [String: ServerTrustEvaluating]) -> NetworkSession {
        return NetworkSession.instance(service: service, evaluators: evaluators)
    }
}
