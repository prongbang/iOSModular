//
//  SettingFeatureCoordinator.swift
//  MDSetting
//
//  Created by prongbang on 26/10/2567 BE.
//

import UIKit
import MDFactory

class SettingFeatureCoordinator: SettingCoordinator {
    
    func navigateToSetting(parent: UIViewController?) {
        let destination = SettingViewController()
        parent?.navigationController?.pushViewController(destination, animated: true)
    }

}
