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
         url: "https://github.com/jeanpierrefortune/keyple.keyple-interop-jsonapi-client-nfc-xcframework/releases/download/1.0.2/keyple-interop-jsonapi-client-nfc-xcframework.zip",
         checksum: "3202abea1b5744abd2a7b74af803391a74504c63ed48a549cc3dc6f5d267a63d") // Generated on 2025-10-10 14:35:42
   ]
)
