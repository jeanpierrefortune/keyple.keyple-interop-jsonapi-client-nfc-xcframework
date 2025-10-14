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
         url: "https://github.com/jeanpierrefortune/keyple.keyple-interop-jsonapi-client-nfc-xcframework/releases/download/1.0.0/keyple-interop-jsonapi-client-nfc-xcframework.zip",
         checksum: "4059d37bf04ff24bdfcd43c72be1a217bdfb466419e9b62ffe36f0113ed1928a") // Generated on 2025-10-14 12:34:03
   ]
)
