// swift-tools-version:5.10

import PackageDescription

let realmVersion = "10.54.0"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "cc496f73c64e4153b0067ba4f80215103a9e8d05cced7c92e12bd33c920cd39d"

#if swift(>=6.0)
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@16.spm.zip"
    let realmSwiftChecksum = "94b1f5cc3d3457536adb0ea3854b0eafa875e698ac5d5d6698268a0d3707b081"
#else
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@15.3.spm.zip"
    let realmSwiftChecksum = "b26b5f0f75d2f554a6252eb09215767df407b7370789fa2acf3ca915afcc6f57"
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
