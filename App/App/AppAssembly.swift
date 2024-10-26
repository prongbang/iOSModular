//
//  AppAssembly.swift
//  App
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Swinject
import MDFactory

class AppAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(Coordinating.self) { _ in
            AppCoordinator()
        }
    }
}
