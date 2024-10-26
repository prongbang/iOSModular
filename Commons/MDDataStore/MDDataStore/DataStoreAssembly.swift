//
//  DataStoreAssembly.swift
//  MDDataStore
//
//  Created by prongbang on 26/10/2567 BE.
//

import Swinject
import SecureStorageSwift
import MDFactory

public class DataStoreAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Swinject.Container) {
        container.register(SecureStorageSwift.self) { _ in
            LocalSecureStorageSwift()
        }
        container.register(DataStore.self, name: DataStoreName.dataStoreKeychain.rawValue) { r in
            DataStoreKeychain(secureStorage: r.resolve(SecureStorageSwift.self)!)
        }
        container.register(DataStore.self, name: DataStoreName.dataStoreMemory.rawValue) { _ in
            DataStoreMemory()
        }
    }

}
