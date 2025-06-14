// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CrashReporterKit",
    platforms: [
        .iOS(.v13) // ✅ Limit platform to iOS so UIKit becomes available
    ],
    products: [
        .library(
            name: "CrashReporterKit",
            targets: ["CrashReporterKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.0.0"),
    ],
    targets: [
        .target(
            name: "CrashReporterKit",
            dependencies: [
                .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk"),
            ]
        ),
        .testTarget(
            name: "CrashReporterKitTests",
            dependencies: ["CrashReporterKit"]
        ),
    ]
)
