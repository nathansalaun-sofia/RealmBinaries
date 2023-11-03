// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.44.0"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/realm/realm-swift/releases/download/v10.44.0/Realm.spm.zip"
    let realmChecksum = "b89a55ca8f11570434028886cb0b06c6509d5c949c67d3aca8fb4d37b25528fe"

#if swift(>=5.9.0)
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v10.44.0/RealmSwift@15.1.spm.zip"
    let realmSwiftChecksum = "acc10a6a5e0dd285be81b487dc0ff8379f8abaf43bde769f9452843ddb81a383"
#else
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v10.44.0/RealmSwift@14.3.1.spm.zip"
    let realmSwiftChecksum = "288a311f83ec1d1dc051084f1aeee51ecb165407ef95f5081c9b20df0b952671"
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
