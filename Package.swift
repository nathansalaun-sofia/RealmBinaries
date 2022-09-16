// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.29.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)"

#if swift(>=5.7.0)
    let xcodeVersion = "14_0_0"
    let realmChecksum = "82f7bc8434f5ec10ae98041c179381625feed28785c877432807eeaf677bb4dc"
    let realmSwiftChecksum = "15d22265026a25cf5dc2e0f032b5cef2dc8eada80ff9d961f73c889ecc1da931"
#else
    let xcodeVersion = "13_4_1"
    let realmChecksum = "ee60b87ef515083e76b92bda7fff36ad9b2695ba82158200216ac8f68dc03a1f"
    let realmSwiftChecksum = "e3de0f57ac813545e00c898a7bca1579855bd89fd89b95186f57eecdd1289cf1"
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
