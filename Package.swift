// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SpaCyKit",
    products: [
        .library(
            name: "SpaCyKit",
            targets: ["SpaCyKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pvieito/PythonKit.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "SpaCyKit",
            dependencies: ["PythonKit"]
        ),
        .testTarget(
            name: "SpaCyKitTests",
            dependencies: ["SpaCyKit"]
        ),
    ]
)
