// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.29.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)"

#if swift(>=5.7.0)
    let xcodeVersion = "14_0_0"
    let realmChecksum = "f33dd693939319b51af936e10ac47b92e3261c0a25e7cd21903c34a61cd9bb89"
    let realmSwiftChecksum = "efc5f7ec34577fca964450fc27b451c09dcd47de28b117df3a34d2c6485efc2a"
#else
    let xcodeVersion = "13_4_1"
    let realmChecksum = "f5dc3f1ede9948f6f5b931629cddd6106569078a07d3282aae645cfb17b1222a"
    let realmSwiftChecksum = "becb3743479f75cd003e85c80dd1b528710c04057e273ca20bfddf99d02d8c73"
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
