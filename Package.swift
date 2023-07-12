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
            url: "https://github.com/fieldday-ai/fieldday-ios-sdk/releases/download/0.9.5/FieldDay-0.9.5.zip",
            checksum: "ca3491b3d7521a70a07cb96635b3f407a212ec0c76fb02b20b05eb44f3b15189"
        )
    ]
)
