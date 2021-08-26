// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PayUSDK",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "PayUSDK",
            targets: ["PayU-SDK-XCFramework"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "PayU-SDK-XCFramework",
            path: "libs/PayU_SDK_Lite.xcframework"
        )
    ],
    swiftLanguageVersions: [.v5]
)
