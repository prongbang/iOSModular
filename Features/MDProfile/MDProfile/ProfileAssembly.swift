//
//  ProfileAssembly.swift
//  MDProfile
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Swinject
import MDFactory

public class ProfileAssembly: Assembly {

    public init() {}
    
    public func assemble(container: Swinject.Container) {
        container.register(ProfileCoordinator.self) { _ in
            ProfileFeatureCoordinator()
        }
    }
    
}
