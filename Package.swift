// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.40.2"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/mattalbus/RealmBinaries/releases/download/\(realmVersion)"

#if swift(>=5.8.0)
    let xcodeVersion = "14_3_1"
    let realmChecksum = "7f229ed97b9df12b1d37649a0e77a4617ad3b088a10701bdfeba16395fd112bf"
    let realmSwiftChecksum = "5b1977889d208e9694c27769f856e9c711acc500b856bc9e386dd8754788175f"
#else
    let xcodeVersion = "14_2_0"
    let realmChecksum = "6063e93f88b4859180aa7e5ee21dfdca4bff2b4effec287c262b976fcb90018b"
    let realmSwiftChecksum = "b4050758f13be33bc5b95e852f1641e574705c6f18a0a9f8feff7a712aaab6f4"
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
