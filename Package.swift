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
         checksum: "2846035f7ebf4d2a1b2a703a1a44919c857706e3c5a82651089f0d37cf415e30") // Generated on 2025-10-10 09:21:11
   ]
)
