// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ChromaKit",
    products: [
        .library(name: "ChromaKit", targets: ["ChromaKit"]),
    ],
    targets: [
        .target(name: "ChromaKit"),
        .testTarget(name: "ChromaKitTests", dependencies: ["ChromaKit"]),
    ]
)
