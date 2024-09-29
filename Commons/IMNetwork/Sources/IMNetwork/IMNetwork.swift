// The Swift Programming Language
// https://docs.swift.org/swift-book

public protocol IMNetwork {
    func get(_ url: String) -> String
    func post(_ url: String) -> String
    func put(_ url: String) -> String
    func patch(_ url: String) -> String
    func delete(_ url: String) -> String
}
