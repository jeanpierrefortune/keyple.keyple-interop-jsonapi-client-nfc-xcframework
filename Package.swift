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
         checksum:"fdf11ded7983c62154d0e6612e42ab73dc1d835a60574b0d3cb80feb2e20b20e") // Generated on 2025-09-26 16:35:36, // Generated on 2025-09-26 12:48:20)
   ]
)
