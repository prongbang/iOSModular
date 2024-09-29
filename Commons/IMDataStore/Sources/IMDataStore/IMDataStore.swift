// The Swift Programming Language
// https://docs.swift.org/swift-book

public protocol IMDataStore {
    func get(key: String) -> String?
    func set(key: String, value: String)
}
