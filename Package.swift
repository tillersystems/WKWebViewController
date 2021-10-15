// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WKWebViewController",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "WKWebViewController", targets: ["WKWebViewController"])
    ],
    dependencies: [
        // JustLayout forked here
    ],
    targets: [
        .target(
            name: "WKWebViewController",
            dependencies: []),
        .testTarget(
            name: "WKWebViewControllerTests",
            dependencies: ["WKWebViewController"])
    ]
)
