// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "termuxSwiftMain",
    products: [
        .executableName(name: "termuxSwiftMain", targets: ["termuxSwiftMain"]),
    ],
    targets: [
        .executableTarget(name: "termuxSwiftMain", dependencies: []),
    ]
)
