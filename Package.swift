// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.42.2"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/realm/realm-swift/releases/download/v10.42.2/Realm.spm.zip"
    let realmChecksum = "b3eee3236de1991cfe6ab3072052c33e4030c01154216bfab94224b2ca92b848"

#if swift(>=5.9.0)
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v10.42.2/RealmSwift@15.0.spm.zip"
    let realmSwiftChecksum = "228b7d129e946cb1a839bd31ac07d4b3713dd89bca01b92b6abccb4756b16a80"
#else
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v10.42.2/RealmSwift@14.3.1.spm.zip"
    let realmSwiftChecksum = "d230e9246837d30d4cca6777013e6c30eed69cc18fe8b302533d5e4c165edafa"
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
