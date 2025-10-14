# Keyple Interop XCFramework

[![License](https://img.shields.io/badge/License-EPL_2.0-blue.svg)](https://www.eclipse.org/legal/epl-2.0/)
[![iOS](https://img.shields.io/badge/iOS-14%2B-green.svg)](https://developer.apple.com/)

This project packages Keyple Interop Distributed Client libraries as a convenient XCFramework for seamless integration
into iOS applications.

## Overview
It acts as an umbrella, packaging:

* [Keyple Interop JSON API Client](https://github.com/eclipse-keyple/keyple-interop-jsonapi-client-kmp-lib): 
  Enables communication with remote Keyple-compliant services using a JSON API.
* [Keyple Interop Local Reader NFC Mobile](https://github.com/eclipse-keyple/keyple-interop-localreader-nfcmobile-kmp-lib):
  Facilitates interaction with local NFC card readers on mobile devices.

### Key Features

* Provides a ready-to-use XCFramework for integrating Keyple Interop Distributed Client functionality into iOS apps.
* Enables your iOS application to communicate with remote Keyple services and interact with smart cards via the local NFC reader.
* Includes helper utilities (e.g. for logging) to streamline development.

### Target Audience

iOS developers building applications that require:
* Secure element interaction capabilities.
* Communication with smart cards via NFC.
* Interaction with remote Keyple-compliant services.

## Documentation & Contribution Guide

The full documentation, including the **user guide**, **download information** and **contribution guide**, is available
on the Keyple website [keyple.org](https://keyple.org).

## Supported Card Technologies

Using this library, iPhones are able to communicate with ISO14443-4 compliant smart cards.

## Development

### Prerequisites

* A Mac with Xcode installed is required to build the iOS framework.

### Supported Platforms

* iOS 14 and later

### Building from Source

```bash
# Build the iOS framework
./gradlew assembleXCFramework
```
