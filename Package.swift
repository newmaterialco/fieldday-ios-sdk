// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FieldDay",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FieldDay",
            targets: ["FieldDay"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "FieldDay",
            url: "https://github.com/fieldday-ai/fieldday-ios-sdk/releases/download/1.0/FieldDay-1.0.zip",
            checksum: "56fc185ed9d9eb7a2ebf722f35d9487ad0912a23ef295ecbefc2cf32745e1de2"
        )
    ]
)
