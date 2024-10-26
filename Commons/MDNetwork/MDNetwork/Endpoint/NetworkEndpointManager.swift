//
//  NetworkEndpointManager.swift
//  MDNetwork
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Foundation
import Moya
import MDFactory

public protocol NetworkEndpointManager {
    func endpoint<Target: TargetNetwork>(service: Target) -> ((Target) -> Endpoint)
}

public class NetworkDefaultEndpointManager: NetworkEndpointManager {
    
    public init() {}
    
    public func endpoint<Target: TargetNetwork>(service: Target) -> ((Target) -> Endpoint) {
        return NetworkEndpoint.defaultEndpoint(for: service)
    }
}
