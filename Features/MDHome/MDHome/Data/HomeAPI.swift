//
//  HomeAPI.swift
//  MDHome
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//


import Foundation
import Moya
import Alamofire
import MDFactory

enum HomeAPI {
    case fetchPost
}

extension HomeAPI: TargetNetwork {
    
    public var task: Task {
        switch self {
        case .fetchPost:
            return .requestPlain
        }
    }
    
    var timeout: TimeInterval {
        return 30
    }
    
    public var headers: [String: String]? {
        return [
            "Brand": "apple"
        ]
    }
    
    public var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    public var path: String {
        switch self {
        case .fetchPost: return "/posts"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .fetchPost:
            return nil
        }
    }
    
    public var validate: Bool {
        return true
    }
}
