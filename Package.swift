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
        .target(
            name: "FieldDay"
        ),
        .binaryTarget(
            name: "FieldDay",
            url: "https://github.com/fieldday-ai/FieldDaySwiftUI/releases/download/0.9.0/fieldday-ios-sdk-0.9.0.zip",
            checksum: "3a04ccfc13065e4ead12539f44b75a1945e32c83e8209bfce93af8e1e318a333"
        )
    ]
)
