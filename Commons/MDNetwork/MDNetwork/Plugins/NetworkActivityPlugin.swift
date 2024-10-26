//
//  NetworkActivityPlugin.swift
//  MDNetwork
//
//  Created by prongbang on 26/10/2567 BE.
//

import Foundation
import Moya
import UIKit
import MDFactory

public final class NetworkActivityPlugin: PluginType {
    
    public init() {}
    
    public func willSend(_ request: RequestType, target: TargetType) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }

    public func didReceive(_ result: NetworkResult, target: TargetType) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
}
