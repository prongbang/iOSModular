// The Swift Programming Language
// https://docs.swift.org/swift-book

public protocol IMCrypto {
    func encrypt(_ data: String) -> String
    func decrypt(_ data: String) -> String
}
