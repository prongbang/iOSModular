//
//  SceneDelegate.swift
//  App
//
//  Created by prongbang on 26/10/2567 BE.
//

import SwiftUI
import MDFactory

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        print("SceneDelegate is connected!")
        
        AppAssembler.registerDependencies()
        
        setupRootViewController(windowScene)
    }
    
    private func setupRootViewController(_ windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        
        window.frame = UIScreen.main.bounds
        self.window = window
        
        // MARK: using container
        // let homeFactory = InjecterContainer.shared.resolve(HomeFactory.self)
        
        // MARK: using assembler
        let homeFactory = InjecterAssempler.shared.resolver.resolve(HomeFactory.self)
        
        guard let homeVC = homeFactory?.makeHomeViewController() else { return }
        
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        navigationController.setViewControllers([homeVC], animated: true)
    }
    
}
