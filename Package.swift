// swift-tools-version:5.10

import PackageDescription

let realmVersion = "10.54.1"

func buildTargets() -> [Target] {
    let realmUrl = "https://github.com/nathansalaun-sofia/RealmBinaries/releases/download/\(realmVersion)/Realm.spm.zip"
    let realmChecksum = "6af25ee246234ac4bf4bb77521de98af141c488a733892d8d809b792148966cf"

    let realmSwiftUrl = "https://github.com/nathansalaun-sofia/RealmBinaries/releases/download/\(realmVersion)/RealmSwift.spm.zip"
    let realmSwiftChecksum = "a4e0f1cf305749ec0ba39f232ca250befe933a43e2da6c304807159b3c851968"
    
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
