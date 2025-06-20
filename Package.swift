// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Slingshot",
    products: [
        .executable(name: "slingshot", targets: ["slingshot"]),
        .library(name: "Slingshot", targets: ["Slingshot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0"),
    ],
    targets: [
        // Library target
        .target(
            name: "Slingshot",
            dependencies: []),
        
        // Executable target (minimal, just imports and runs)
        .executableTarget(
            name: "slingshot",
            dependencies: [
                "Slingshot",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        
        // Test target
        .testTarget(
            name: "SlingshotTests",
            dependencies: ["Slingshot"]),
    ]
)
