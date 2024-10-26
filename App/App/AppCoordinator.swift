//
//  AppCoordinator.swift
//  App
//
//  Created by prongbang on 26/10/2567 BE.
//

import Foundation
import UIKit
import MDFactory

class AppCoordinator: Coordinating {
    
    @Injected private var homeCoordinator: HomeCoordinator
    @Injected private var profileCoordinator: ProfileCoordinator
    @Injected private var settingCoordinator: SettingCoordinator
    
    func navigateToHome(parent: UIViewController?) {
        homeCoordinator.navigateToHome(parent: parent)
    }
    
    func navigateToSetting(parent: UIViewController?) {
        settingCoordinator.navigateToSetting(parent: parent)
    }
    
    func navigateToProfile(parent: UIViewController?) {
        profileCoordinator.navigateToProfile(parent: parent)
    }

}
