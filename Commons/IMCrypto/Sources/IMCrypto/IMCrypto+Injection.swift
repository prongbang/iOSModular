//
//  IMCrypto+Injection.swift
//  IMCrypto
//
//  Created by DARRAN on 29/9/2567 BE.
//
import Factory

extension Container {
    var imCrypto: Factory<IMCrypto> {
        self { IMCryptoLogic() }
    }
}
