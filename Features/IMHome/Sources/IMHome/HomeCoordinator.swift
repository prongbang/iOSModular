//
//  IMHomeCoordinator.swift
//  IMHome
//
//  Created by DARRAN on 29/9/2567 BE.
//
import IMCoordinator
import UIKit
import Factory

public protocol HomeCoordinator {
    func navigateToHome()
}

public class HomeCoordinatorLogic: HomeCoordinator {

    @Injected(\.navigationController) var navigationController: UINavigationController
    
    public func navigateToHome() {
        let vc = HomeViewController()
        
        navigationController.pushViewController(vc, animated: false)
    }
    
}
