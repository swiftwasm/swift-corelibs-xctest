// swift-tools-version:4.2
//
// To build with auto-linking of the .swiftmodule use:
// $ swift build -Xswiftc -module-link-name -Xswiftc XCTest
//

import PackageDescription

let package = Package(
    name: "XCTest",
    products: [
        .library(
            name: "XCTest",
            targets: ["XCTest"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/fabianfett/pure-swift-json.git", .upToNextMajor(from: "0.2.1")),
        .package(url: "https://github.com/MaxDesiatov/WASIFoundation.git", .branch("master")),
        .package(url: "https://github.com/MaxDesiatov/AnyCodable", .branch("master")),
    ],
    targets: [
        .target(name: "XCTest", dependencies: ["AnyCodable", "WASIFoundation", "PureSwiftJSONCoding"], path: "Sources"),
    ]
)
