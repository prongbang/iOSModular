//
//  CoreAssembly.swift
//  MDCore
//
//  Created by prongbang on 26/10/2567 BE.
//

import Foundation
import UIKit
import Swinject

public class CoreAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Swinject.Container) {
        container.register(UIApplication.self) { _ in
            UIApplication.shared
        }

        container.register(UserDefaults.self) { _ in
            UserDefaults.standard
        }

        container.register(Bundle.self) { _ in
            Bundle.main
        }

        container.register(FileManager.self) { _ in
            FileManager.default
        }
    }
    
}
