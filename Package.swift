// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.28.4"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)"

    let xcodeVersion = "13_4_1"
    let realmChecksum = "1d0ec4491524148ec4ebf5f38b3d6c095f3cb8f65ecb4cae8d2b5b661096bc1f"
    let realmSwiftChecksum = "0aeb90b6a74d0753bc791caa0cfc08f35b040a54a499f313a32c28e51f627b40"
    
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
