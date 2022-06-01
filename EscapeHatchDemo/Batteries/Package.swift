// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Batteries",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "Batteries",
            targets: ["Batteries"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Batteries",
            dependencies: []),
        .testTarget(
            name: "BatteriesTests",
            dependencies: ["Batteries"]),
    ]
)
