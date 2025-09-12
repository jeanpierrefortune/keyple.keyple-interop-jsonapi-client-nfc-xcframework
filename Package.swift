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
         url: "https://github.com/tdassonville/keyple-interop-jsonapi-client-ios/releases/download/0.16.0/keyple_interop_jsonapi_client_ioslib.xcframwork.zip",
         checksum:"9a2e8c6ebe0415ac2e22e2d7fd11fbeb031f0dbf5d7d62d34ef494eb03f1ad55")
   ]
)
