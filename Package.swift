// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Slingshot",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1)
    ],
    products: [
        .executable(name: "slingshot", targets: ["SlingshotCLI"]),
        .library(name: "Slingshot", targets: ["Slingshot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0"),
    ],
    targets: [
        // Executable target
        .executableTarget(
            name: "SlingshotCLI",
            dependencies: [
                "Slingshot",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        
        // Library target
        .target(
            name: "Slingshot",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        
        // Test target for the library using Swift Testing only
        .testTarget(
            name: "SlingshotTests",
            dependencies: ["Slingshot"]),
    ]
)
