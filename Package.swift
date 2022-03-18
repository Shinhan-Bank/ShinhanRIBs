// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShinhanRIBs",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "ShinhanRIBs",
            targets: ["ShinhanRIBs"]
        ),
    ],
    targets: [
        .target(
            name: "ShinhanRIBs",
            path: "Sources",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "ShinhanRIBsTests",
            dependencies: ["ShinhanRIBs"],
            path: "Tests",
            exclude: ["Info.plist"]
        ),
    ]
)
