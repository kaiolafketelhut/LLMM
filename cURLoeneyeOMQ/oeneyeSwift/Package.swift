// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "oeneyeSwiftBell",
    products: [
        .library(name: "oeneyeSwiftBell", targets: ["oeneyeSwiftBell"]),
    ],
    targets: [
        .target(name: "oeneyeSwiftBell", dependencies: []),
        .testTarget(name: "oeneyeSwiftBellTests", dependencies: ["oeneyeSwiftBell"]),
    ]
)
