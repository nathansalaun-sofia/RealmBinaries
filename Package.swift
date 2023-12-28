// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.45.2"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "2d7cdd5bb09375e1acd0b9e332f28515667aaa7b78f1b70c945a296f2c10cb5f"

#if swift(>=5.9.2)
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@15.1.spm.zip"
    let realmSwiftChecksum = "633e386a2987d8f5a25543c8bfc3067ab5f63a373914fe336f74d71e97f09ad9"
#else
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@15.0.spm.zip"
    let realmSwiftChecksum = "8f353b9f82888f9173a682875e22d79015b45b4d4b8fe8cbafd57584ae5da3b5"
#endif
    
    return [
        .binaryTarget(
            name: "Realm",
            url: realmUrl,
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: realmSwiftUrl,
            checksum: realmSwiftChecksum
        )
    ]
}

let package = Package(
    name: "RealmBinaries",
    platforms: [.iOS("13.0")],
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
