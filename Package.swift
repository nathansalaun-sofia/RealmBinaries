// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.33.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)"

#if swift(>=5.7.0)
    let xcodeVersion = "14_1_0"
    let realmChecksum = "8dd952296f2ab8683de09807bf21b5a25555273185fdca9246fec0c48fd60108"
    let realmSwiftChecksum = "07e6078544e062d0f38d02180fc05c7706820fed7c82a8bdb47362b1b664c90f"
#else
    let xcodeVersion = "13_4_1"
    let realmChecksum = "cf52351ef6c90dd07ba6289442fee3f0a99185eeb337b3ef599619a851d645c1"
    let realmSwiftChecksum = "3b5ffc14887297e2af4fc285ba3b5ba3d69ff251e5b6c2e13a43a85ca215282d"
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
