// swift-tools-version:5.3

import PackageDescription

let realmVersion = "10.49.1"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "2b7854a2f9372a7d89495cf854c18a9d60b15ed1057afafecd24b6f4281634df"

#if swift(>=5.10)
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@15.3.spm.zip"
    let realmSwiftChecksum = "cc0c4b32cdec945593b53bd1c80770ec2b4dbe4385efbb864e9dd0691deb4fc5"
#else
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@15.1.spm.zip"
    let realmSwiftChecksum = "2e3b01f36756134a318a38408504377fe076fd4b1999bfc977749f126049d279"
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
