//
//  SecretBoxCryptography.swift
//  MDCrypto
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Sodium
import MDFactory

public class SecretBoxCryptography: Cryptography {
    
    private let sodium: Sodium
    
    public init(sodium: Sodium) {
        self.sodium = sodium
    }
    
    public func encrypt(sharedKey: String, data: String) -> String? {
        let message = data.bytes
        let secretKey = sodium.utils.hex2bin(sharedKey)
        if let encrypted: Bytes = sodium.secretBox.seal(message: message, secretKey: secretKey!) {
            return byteToHex(bytes: encrypted)
        }
        return nil
    }
    
    public func decrypt(sharedKey: String, data: String) -> String? {
        let secretKey = sodium.utils.hex2bin(sharedKey)
        guard let cipher = sodium.utils.hex2bin(data) else { return "" }
        if let decrypted = sodium.secretBox.open(nonceAndAuthenticatedCipherText: cipher, secretKey: secretKey!) {
            return String(bytes: decrypted, encoding: .utf8) ?? ""
        } else {
            return ""
        }
    }
    
    private func byteToHex(bytes: Bytes) -> String? {
        return sodium.utils.bin2hex(bytes)
    }
}
