//
//  DataStoreKeychain.swift
//  MDDataStore
//
//  Created by prongbang on 26/10/2567 BE.
//

import Foundation
import SecureStorageSwift
import MDFactory

public class DataStoreKeychain: DataStore {

    private let secureStorage: SecureStorageSwift
    
    public init(secureStorage: SecureStorageSwift) {
        self.secureStorage = secureStorage
    }
    
    public func get(key: String) -> String? {
        return secureStorage.read(key: key)
    }
    
    public func set(key: String, value: String) -> Bool {
        return secureStorage.write(key: key, value: value)
    }
    
    public func del(key: String) -> Bool {
        return secureStorage.delete(key: key)
    }
    
}
