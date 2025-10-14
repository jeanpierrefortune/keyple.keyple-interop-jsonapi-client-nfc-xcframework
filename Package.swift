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
         checksum: "becf4bb7cfd61c03c757b062eb19d6d49841d12e7426655e4e4fbc9f6487c9ca") // Generated on 2025-10-14 13:40:19
   ]
)
