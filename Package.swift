// swift-tools-version:5.3
import PackageDescription

let package = Package(
   name: "keyple-interop-jsonapi-client-nfc-xcframework",
   platforms: [
     .iOS(.v14),
   ],
   products: [
      .library(name: "KeypleInteropJsonapiClientNfc", targets: ["KeypleInteropJsonapiClientNfc"])
   ],
   targets: [
      .binaryTarget(
         name: "KeypleInteropJsonapiClientNfc",
         url: "https://github.com/jeanpierrefortune/keyple.keyple-interop-jsonapi-client-nfc-xcframework/releases/download/1.0.1/keyple-interop-jsonapi-client-nfc-xcframework.zip",
         checksum: "f330d7bc8a72f42559598d442b298cc6fb031ec3e66fdfa3a47a636471506403") // Generated on 2025-10-09 15:50:00
   ]
)
