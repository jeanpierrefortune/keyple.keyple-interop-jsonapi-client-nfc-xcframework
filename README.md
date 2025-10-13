# Keyple Interop Distributed Client iOS XCFramework

[![License](https://img.shields.io/badge/license-BSD_3_Clause-blue.svg)](LICENSE)
[![Java](https://img.shields.io/badge/java-8%2B-orange.svg)](https://openjdk.java.net/)
[![iOS](https://img.shields.io/badge/iOS-green.svg)](https://developer.apple.com/)

This project packages Keyple Interop Distributed Client libraries as a convenient XCFramework for seamless integration into iOS applications.

## Overview
It acts as an umbrella, packaging:

*   [Keyple Interop Distributed JSON API Client](https://github.com/eclipse-keyple/keyple-interop-jsonapi-client-kmp-lib): Enables communication with remote Keyple-compliant services using a JSON API.
*   [Keyple Interop NFC Mobile Local Reader](https://github.com/eclipse-keyple/keyple-interop-localreader-nfcmobile-kmp-lib): Facilitates interaction with local NFC card readers on mobile devices.


### Key Features

*   Provides a ready-to-use XCFramework for integrating Keyple Interop Distributed Client functionality into iOS apps.
*   Includes helper utilities (e.g. for logging) to streamline development.
*   Enables your iOS application to communicate with remote Keyple services and interact with smart cards via local NFC readers.

### Target Audience

iOS developers building applications that require:
*   Secure element interaction capabilities.
*   Communication with smart cards via NFC.
*   Interaction with remote Keyple-compliant services.

Refer to [Keyple Interop Distributed JSON API Client](https://github.com/eclipse-keyple/keyple-interop-jsonapi-client-kmp-lib) for code usage.

Note: A Kotlin Multiplatform Mobile implementation is demonstrated in the project [Keyple Demo Ticketing](https://github.com/calypsonet/keyple-demo-ticketing/tree/main/src/reloading-remote/client/interop-mobile-multiplatform)


## Supported Card Technologies

Using this library, iPhones are able to communicate with the following card technologies: 
FIXME

## Development

### Prerequisites
- A mac (M -- arm based) to build the iOS Framework

### Supported Platforms
- iOS 14+

### Building from Source
```bash
# Build the iOS Framework
./gradlew assembleXCFramework
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Follow the coding standards and documentation templates
4. Submit a pull request with clear description
5. Ensure all tests pass and documentation is updated

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.

## Support

- **Documentation**: [keyple.org](https://keyple.org)
- **Community**: [Calypso Networks Association](https://calypsonet.org)
- **Issues**: Use GitHub Issues for bug reports and feature requests
- **Technical Support**: [Contact CNA](https://calypsonet.org/contact-us/)

## Related Projects

- [Keyple Demo Ticketing](https://github.com/calypsonet/keyple-demo-ticketing/)
- [Keyple Distributed JSON API](https://keyple.org/learn/user-guide/distributed-json-api-1-0/)
- [Eclipse Keyple middleware](https://keyple.org) - Core SDK and plugins
- [Calypso Card Specification](https://calypsonet.org/technical-specifications/)
