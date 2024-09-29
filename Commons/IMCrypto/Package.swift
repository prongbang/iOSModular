// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IMCrypto",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IMCrypto",
            targets: ["IMCrypto"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jedisct1/swift-sodium.git", from: "0.9.1"),
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "IMCrypto"),
        .testTarget(
            name: "IMCryptoTests",
            dependencies: ["IMCrypto"]),
    ]
)
