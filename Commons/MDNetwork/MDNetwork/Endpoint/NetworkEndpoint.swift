//
//  NetworkEndpoint.swift
//  MDNetwork
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Foundation
import Moya
import MDFactory

public class NetworkEndpoint {
    
    public init() {}
    
    final class func defaultEndpoint <Target: TargetNetwork> (for _: Target) -> ((Target) -> Endpoint) {
        return { (target: Target) -> Endpoint in
            return Endpoint(
                url: URL(target: target).absoluteString,
                sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }
    }
    
}
