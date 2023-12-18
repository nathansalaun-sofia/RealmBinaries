// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.45.0"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "5215a659194877250a3ace4037ff228e217a77cd56af566bcc5f55730654a896"

#if swift(>=5.9.2)
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@15.1.spm.zip"
    let realmSwiftChecksum = "b8c4f8d88c574420a0668cb46d6b0d3cf30c4d0076128540ae2e092c538c04e4"
#else
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@15.0.spm.zip"
    let realmSwiftChecksum = "3d88695aae788fe2b08eadf25231561e0a81bc3dbd9a84d732ca6428f215d9e8"
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
