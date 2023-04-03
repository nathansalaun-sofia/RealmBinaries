// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.38.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)"

#if swift(>=5.8.0)
    let xcodeVersion = "14_3_0"
    let realmChecksum = "f1882d822ff95320effc15b0fa7ae105dcac6a7581e62f0784650d1e3cbf6d36"
    let realmSwiftChecksum = "797e6368836837c3a4f27601de7db4403da0aadc99da828b6faa37558460e483"
#else
    let xcodeVersion = "14_2_0"
    let realmChecksum = "addb91ce6e191b61d65dc5d9015964edb4d1a6337b58dcf66c2e0d24658e314d"
    let realmSwiftChecksum = "90108caad65b49db03cdaad7769bb939c50887bb5bbba704cfd4421931c4bdba"
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
