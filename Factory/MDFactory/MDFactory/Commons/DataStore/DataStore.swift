//
//  DataStore.swift
//  MDFactory
//
//  Created by prongbang on 26/10/2567 BE.
//

import Foundation

public enum DataStoreName: String {
    case dataStoreKeychain = "dataStoreKeychain"
    case dataStoreMemory = "dataStoreMemory"
}

public protocol DataStore {
    func get(key: String) -> String?
    func set(key: String, value: String) -> Bool
    func del(key: String) -> Bool
}
