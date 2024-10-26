//
//  SettingAssembly.swift
//  MDSetting
//
//  Created by prongbang on 26/10/2567 BE.
//

import Swinject
import MDFactory

public class SettingAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Swinject.Container) {
        container.register(SettingCoordinator.self) { _ in
            SettingFeatureCoordinator()
        }
    }
    
}
