// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Slingshot",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "SlingshotKit",
            targets: ["SlingshotKit"]
        ),
        .executable(
            name: "slingshot",
            targets: ["slingshot"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0")
    ],
    targets: [
        .target(
            name: "SlingshotKit"
        ),
        .executableTarget(
            name: "slingshot",
            dependencies: [
                "SlingshotKit",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "SlingshotKitTests",
            dependencies: ["SlingshotKit"]
        )
    ]
)
