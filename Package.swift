// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.29.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)"

#if swift(>=5.7.0)
    let xcodeVersion = "14_0_0"
    let realmChecksum = "7f240227fc083246e5955e15d830c18ccee9eb398b5c0e5f31ffee5b3f1bf4db"
    let realmSwiftChecksum = "c5a2a26b3152eb20bb7a9126f6ba40ca22405f0a63923a8555e14e65962191b2"
#else
    let xcodeVersion = "13_4_1"
    let realmChecksum = "797d2073be1c313d2423756dfa73a1f048b4cf8c46ad855d9c77cd3e1ae46480"
    let realmSwiftChecksum = "36795671b1b92934767aa6d0f53aae50904faa943389e742b2e092bd548f1e7c"
#endif
    
    return [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm_\(xcodeVersion).xcframework.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift_\(xcodeVersion).xcframework.zip",
            checksum: realmSwiftChecksum
        )
    ]
}

let package = Package(
    name: "RealmBinaries",
    platforms: [.iOS("12.0")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Realm",
            targets: ["Realm"]),
        .library(
            name: "RealmSwift",
            targets: ["RealmSwift"])
    ],
    targets: buildTargets()
)
