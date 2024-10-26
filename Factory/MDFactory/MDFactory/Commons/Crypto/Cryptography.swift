//
//  Cryptography.swift
//  MDFactory
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Foundation

public protocol Cryptography {
    func encrypt(sharedKey: String, data: String) -> String?
    func decrypt(sharedKey: String, data: String) -> String?
}
