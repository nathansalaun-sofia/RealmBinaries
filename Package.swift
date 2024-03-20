// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.48.1"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "9df06aa37e11a366d58b819d12e02ab25e456944c6eb67609538f3175fe57d8c"

#if swift(>=5.10)
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@15.3.spm.zip"
    let realmSwiftChecksum = "f2b1aa3b94b1f999213f8dc6966cd1ce45dbe53568ec9db177a0df346e01c943"
#else
    let realmSwiftUrl = "https://github.com/realm/realm-swift/releases/download/v\(realmVersion)/RealmSwift@15.1.spm.zip"
    let realmSwiftChecksum = "d24e8f21a10b604e30dcc75cbe96df298074725ec0f531957e600d99a9e4f8e4"
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
