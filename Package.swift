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
         checksum: "062c22499f1a8363ada03123da41f24ced739c15b612105c206489e7a5e02976") // Generated on 2025-10-14 10:31:42
   ]
)
