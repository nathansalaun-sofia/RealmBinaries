// swift-tools-version:5.10

import PackageDescription

let realmVersion = "20.0.0"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "11428c01a60a81fb6a314d562de86cf724cd114330c36bcb4415ed276332f176"

#if swift(>=6.0)
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@16_beta_6.spm.zip"
    let realmSwiftChecksum = "a6e83219ddefd9731aaf39c6a59589cfa998665abdd241398c59c7ae83332253"
#else
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@15.3.spm.zip"
    let realmSwiftChecksum = "176459362564610949b83024c604844519d5c0dba759743356c047a86209863a"
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
    platforms: [.iOS("15.0")],
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
