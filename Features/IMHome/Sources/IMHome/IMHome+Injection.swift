// The Swift Programming Language
// https://docs.swift.org/swift-book

import Factory
import IMCoordinator

extension Container {
    public var homeCoordinator: Factory<HomeCoordinator> {
        self {HomeCoordinatorLogic()}
    }
}
