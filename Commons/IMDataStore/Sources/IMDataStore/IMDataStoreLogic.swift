//
//  IMDataStoreLogic.swift
//  IMDataStore
//
//  Created by DARRAN on 29/9/2567 BE.
//

public class IMDataStoreLogic: IMDataStore {
    
    public init() {}
    
    public func get(key: String) -> String? {
        return "Mocked Value"
    }
    
    public func set(key: String, value: String) {
        print("key: \(key), value: \(value)")
    }
}
