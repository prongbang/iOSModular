//
//  ProfileFeatureCoordinator.swift
//  MDProfile
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import UIKit
import MDFactory

class ProfileFeatureCoordinator: ProfileCoordinator {
    
    func navigateToProfile(parent: UIViewController?) {
        let destination = ProfileViewController()
        parent?.navigationController?.pushViewController(destination, animated: true)
    }
    
}
