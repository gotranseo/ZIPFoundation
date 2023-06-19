// swift-tools-version:5.0
import PackageDescription

#if canImport(Compression)
let targets: [Target] = [
    .target(name: "ZIPFoundation"),
    .testTarget(name: "ZIPFoundationTests", dependencies: [.target(name: "ZIPFoundation")])
]
#else
let targets: [Target] = [
    .target(name: "CZLib", dependencies: [], cSettings: [.define("_GNU_SOURCE", to: "1")]),
    .target(name: "ZIPFoundation", dependencies: [.target(name: "CZLib")], cSettings: [.define("_GNU_SOURCE", to: "1")]),
    .testTarget(name: "ZIPFoundationTests", dependencies: [.target(name: "ZIPFoundation")])
]
#endif

let package = Package(
    name: "ZIPFoundation",
    platforms: [
        .macOS(.v10_11), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        .library(name: "ZIPFoundation", targets: ["ZIPFoundation"]),
    ],
    targets: targets,
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
