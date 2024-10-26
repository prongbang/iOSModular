//
//  HomeRepository.swift
//  MDHome
//
//  Created by prongbang on 26/10/2567 BE.
//

import Foundation
import MDFactory
import PromiseKit
import Moya

protocol HomeRepository {
    func fetchPostList() -> (Promise<Results<[Post]>>, Cancellable)
}

class HomeRepositoryLogic: HomeRepository {
    
    private let network: Network
    
    public init(network: Network) {
        self.network = network
    }
    
    public func fetchPostList() -> (Promise<Results<[Post]>>, Cancellable) {
        let service = HomeAPI.fetchPost
        
        return network.requester<[Post]>(service: service)
    }
    
}
