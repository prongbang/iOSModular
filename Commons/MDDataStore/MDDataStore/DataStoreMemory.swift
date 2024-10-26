//
//  DataStoreMemory.swift
//  MDDataStore
//
//  Created by prongbang on 26/10/2567 BE.
//

import Foundation
import MDFactory

public class DataStoreMemory: DataStore {
    
    private var data: [String: String] = [:]
    
    // Use a serial queue for thread-safety
    private let queue = DispatchQueue(label: "com.prongbang.datastore.queue")
    
    public func get(key: String) -> String? {
        return queue.sync {
            data[key]
        }
    }
    
    public func set(key: String, value: String) -> Bool {
        queue.sync {
            data[key] = value
            return true
        }
    }
    
    public func del(key: String) -> Bool {
        return queue.sync {
            if data.removeValue(forKey: key) != nil {
                return true
            }
            return false
        }
    }
    
}
