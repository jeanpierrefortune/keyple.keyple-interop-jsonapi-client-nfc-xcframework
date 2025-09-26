// swift-tools-version:5.3
import PackageDescription

let package = Package(
   name: "keyple-interop-jsonapi-client-ioslib",
   platforms: [
     .iOS(.v14),
   ],
   products: [
      .library(name: "keyple-interop-jsonapi-client-ioslib", targets: ["keyple-interop-jsonapi-client-ioslib"])
   ],
   targets: [
      .binaryTarget(
         name: "keyple-interop-jsonapi-client-ioslib",
         url: "https://github.com/jeanpierrefortune/keyple.keyple-interop-jsonapi-client-nfc-xcframework/releases/download/1.0.0/keyple-interop-jsonapi-client-nfc-xcframework.zip",
         checksum:"XXXXXXXXXXXXXXX")
   ]
)
