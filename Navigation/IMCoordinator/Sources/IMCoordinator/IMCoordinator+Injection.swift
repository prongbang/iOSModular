//
//  IMCoordinator+Injection.swift
//  IMCoordinator
//
//  Created by DARRAN on 29/9/2567 BE.
//

import Factory
import UIKit

extension Container {
    public var navigationController: Factory<UINavigationController> {
        self { UINavigationController() }
    }
}

