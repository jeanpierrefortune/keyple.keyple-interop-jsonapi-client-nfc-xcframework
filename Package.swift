// swift-tools-version:5.3
import PackageDescription

let package = Package(
   name: "KeypleInterop",
   platforms: [
     .iOS(.v14),
   ],
   products: [
      .library(name: "KeypleInterop", targets: ["KeypleInterop"])
   ],
   targets: [
      .binaryTarget(
         name: "KeypleInterop",
         url: "https://github.com/jeanpierrefortune/keyple.keyple-interop-jsonapi-client-nfc-xcframework/releases/download/1.0.0/KeypleInterop-1.0.0-xcframework.zip",
         checksum: "4059d37bf04ff24bdfcd43c72be1a217bdfb466419e9b62ffe36f0113ed1928a") // Generated on 2025-10-14 12:34:03
   ]
)
