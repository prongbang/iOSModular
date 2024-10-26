//
//  HomeAssembly.swift
//  MDHome
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Swinject
import MDFactory

public class HomeAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Swinject.Container) {
        container.register(HomeRepository.self) { r in
            return HomeRepositoryLogic(network: r.resolve(Network.self)!)
        }
        container.register(GetPostListUseCase.self) { r in
            return GetPostListUseCaseLogic(repository: r.resolve(HomeRepository.self)!)
        }
        container.register(HomeFactory.self) { _ in
            return HomeFeatureFactory()
        }
        container.register(HomeCoordinator.self) { _ in
            return HomeFeatureCoordinator()
        }
    }
    
}
