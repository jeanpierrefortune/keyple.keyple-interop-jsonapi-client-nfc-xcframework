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
         checksum: "95c70f50f9d3fd8ce249e0cccf7e27170f6a1bb41c5fb385c83b7a546aeb42fb") // Generated on 2025-10-14 13:20:55
   ]
)
