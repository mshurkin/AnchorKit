// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnchorKit",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "AnchorKit", targets: ["AnchorKit"])
    ],
    targets: [
        .target(
            name: "AnchorKit",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "AnchorKitTests",
            dependencies: ["AnchorKit"],
            exclude: ["Info.plist"]
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
