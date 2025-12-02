// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FawryPaySPM",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FawryPaySPM",
            targets: ["FawryPaySPM"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.10.2"),
        .package(url: "https://github.com/hackiftekhar/IQKeyboardManager.git", from: "6.5.16"),
        .package(url: "https://github.com/kasketis/netfox.git", from: "1.21.0")
    ],
    targets: [
         //Targets are the basic building blocks of a package, defining a module or a test suite.
         //Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(name: "FawryPaySDK", path: "./Sources/FawryPaySDK.xcframework"),
        .target(
            name: "FawryPaySPM",
            dependencies: [
                "FawryPaySDK",
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "netfox", package: "netfox"),
                .product(name: "IQKeyboardManagerSwift", package: "IQKeyboardManager"),
              ],
        ),
    ],
)

