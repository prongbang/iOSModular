//
//  ObjectScope.swift
//  MDCore
//
//  Created by prongbang on 26/10/2567 BE.
//


import Swinject

public extension ObjectScope {
    
    /// How to use:
    ///
    /// Register:
    ///  container.register(LastViewedProductsRepository.self) { r in AnyObject() }.inObjectScope(.discardedWhenLogout)
    ///
    /// Using:
    ///  container.resetObjectScope(.discardedWhenLogout)
    ///
    static let discardedWhenLogout = ObjectScope(
        storageFactory: PermanentStorage.init,
        description: "discardedWhenLogout"
    )
}
