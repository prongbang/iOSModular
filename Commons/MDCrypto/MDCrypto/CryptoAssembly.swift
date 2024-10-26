//
//  CryptoAssembly.swift
//  MDCrypto
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Swinject
import Sodium
import MDFactory

public class CryptoAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Swinject.Container) {
        container.register(Sodium.self) { _ in Sodium() }
        container.register(Cryptography.self) { r in
            return SecretBoxCryptography(sodium: r.resolve(Sodium.self)!)
        }
    }
    
}
