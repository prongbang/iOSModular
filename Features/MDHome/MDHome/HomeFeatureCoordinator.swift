//
//  HomeFeatureCoordinator.swift
//  MDHome
//
//  Created by prongbang on 26/10/2567 BE.
//

import UIKit
import MDFactory

class HomeFeatureCoordinator: HomeCoordinator {
    
    func navigateToHome(parent: UIViewController?) {
        let destination = HomeViewController()
        parent?.navigationController?.pushViewController(destination, animated: true)
    }
    
}
