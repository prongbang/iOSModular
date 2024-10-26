//
//  GetPostListUseCase.swift
//  MDHome
//
//  Created by prongbang on 26/10/2567 BE.
//

import PromiseKit
import MDFactory

protocol GetPostListUseCase {
    func execute() -> Promise<Results<[Post]>>
}

class GetPostListUseCaseLogic: GetPostListUseCase {
    
    private let repository: HomeRepository
    
    public init(repository: HomeRepository) {
        self.repository = repository
    }
    
    public func execute() -> Promise<Results<[Post]>> {
        let (promise, _) = repository.fetchPostList()
        
        return promise
    }

}
