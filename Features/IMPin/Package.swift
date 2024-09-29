// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IMPin",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IMPin",
            targets: ["IMPin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.2"),
        
        // MARK: Foundation Dependencies
        .package(path: "../Foundation/IMCore"),
        .package(path: "../Foundation/IMLocalization"),
        
        // MARK: Components Dependencies
        .package(path: "../Components/IMComponent"),
        
        // MARK: Commons Dependencies
        .package(path: "../Commons/IMNetwork"),
        .package(path: "../Commons/IMDataStore"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "IMPin",
            dependencies: [
                "IMCore",
                "IMLocalization",
                "IMComponent",
                "IMNetwork",
                "IMDataStore",
            ]),
        .testTarget(
            name: "IMPinTests",
            dependencies: ["IMPin"]),
    ]
)
