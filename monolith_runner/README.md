A runner package for executing all monolith features from a unified command-line interface.
By adding it to `dev_dependencies`, you can access all monolith functionality through `dart run monolith_runner:*` commands.

## Features

* **Unified Command Line**: Execute all monolith features with a consistent interface
* **Development Integration**: Simple integration through dev_dependencies
* **Automatic Feature Discovery**: Automatic detection and execution of available monolith features
* **Error Handling**: Appropriate error messages and help display

## Getting started

Add to the `dev_dependencies` section of your project's `pubspec.yaml`:

```yaml
# pubspec.yaml
dev_dependencies:
  monolith_runner: ^1.0.0
```

## Usage

```yaml
# monolith.yaml - Configuration example
# Note: This file should be committed to version control

# Include secrets file (injected by op inject command)
includes:
  - secrets/monolith.yaml

# Dart Define configuration
define:
  output_path: secrets/dart-define/
  generate:
    package_name: foundation_metadata
    helper_path: lib/gen/defines.dart
    # optional, default: `test`
    test_flavor: test
  # required
  flavors:
    development:
      FLAVOR: development
      API_URL: https://api-dev.example.com
      DEBUG_MODE: true
      LOG_LEVEL: debug
    production:
      FLAVOR: production
      API_URL: https://api.example.com
      DEBUG_MODE: false
      LOG_LEVEL: info
    test:
      FLAVOR: development
      API_URL: https://api-test.example.com
      DEBUG_MODE: true
      LOG_LEVEL: debug

# Localization configuration
localization:
  # required
  languages:
    - ja
    - en
  app:
    # required, module name
    package_name: app
    # optional, default: `lib/l10n/`
    arb_path: lib/l10n/
    # optional, default: `intl_app_`
    arb_file_prefix: intl_app_
    # optional, default: `L10nHelper`
    l10n_helper_class_name: L10nHelper
    # optional, default: `lib/l10n/l10n_helper.dart`
    l10n_helper_path: lib/l10n/l10n_helper.dart
  package:
    # required, path to packages (relative to root)
    path_prefixes:
      - app/
      - packages/
    # optional, default: `res/`
    resources_path: res/
    # optional, default: `L10nStringsMixin`
    module_helper_class_name: L10nStringsMixin
    # optional, default: `lib/gen/strings.dart`
    module_helper_path: lib/gen/strings.dart

# Xcode project generation configuration
xcodegen:
  # required
  package_name: app
  # optional - files to create before xcodegen execution
  touch_files:
    - ios/GoogleService-Info.plist
    - ios/firebase_app_id_file.json
  # optional - environment variables for xcodegen
  env:
    DEVELOPMENT_TEAM: ABCD123456
    CODE_SIGN_IDENTITY: "iPhone Developer"
    BUNDLE_ID_SUFFIX: dev

# File installation configuration
install:
  # Android files
  - path: secrets/android.keystore
    base64_file: <base64_encoded_keystore_content>
  - path: secrets/android.properties
    text_file: |
      android.projectName = MyApp
      android.applicationId = com.example.myapp
      android.keystore.password = <keystore_password>
      android.keystore.debug.password = <debug_password>
      android.keystore.release.password = <release_password>
  - path: app/android/app/src/development/google-services.json
    base64_file: <base64_encoded_google_services_json>
  - path: app/android/app/src/production/google-services.json
    base64_file: <base64_encoded_google_services_json>

  # iOS files - Development
  - path: app/ios/Configurations/Debug-development/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>
  - path: app/ios/Configurations/Profile-development/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>
  - path: app/ios/Configurations/Release-development/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>

  # iOS files - Production
  - path: app/ios/Configurations/Debug-production/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>
  - path: app/ios/Configurations/Profile-production/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>
  - path: app/ios/Configurations/Release-production/GoogleService-Info.plist
    base64_file: <base64_encoded_google_service_plist>
```

**Using with 1Password CLI:**
```yaml
# For production use with 1Password CLI
# Replace placeholders with actual 1Password references

xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist
  env:
    DEVELOPMENT_TEAM: op://vault-id/apple-developer/team-id
    CODE_SIGN_IDENTITY: op://vault-id/apple-developer/code-sign-identity
    BUNDLE_ID_SUFFIX: op://vault-id/app-config/bundle-suffix

install:
  - path: secrets/android.keystore
    base64_file: op://vault-id/android-keystore/keystore.base64
  - path: secrets/android.properties
    text_file: |
      android.projectName = MyApp
      android.applicationId = com.example.myapp
      android.keystore.password = op://vault-id/android-keystore/keystore-password
      android.keystore.debug.password = op://vault-id/android-keystore/debug-password
      android.keystore.release.password = op://vault-id/android-keystore/release-password
  - path: app/ios/Configurations/Release-production/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-production.plist.base64
```

**Available commands**:
```bash
# Install secret files
dart run monolith_runner:install

# Generate localization resources
dart run monolith_runner:localization

# Generate Dart Define constants
dart run monolith_runner:define

# Generate Xcode project
dart run monolith_runner:xcodegen
```

**CI/CD integration example**:
```yaml
# .github/workflows/build.yml
name: Build
on: [push, pull_request]

jobs:
  build:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        
      - name: Install dependencies
        run: dart pub get
        
      - name: Setup development environment
        env:
          OP_SERVICE_ACCOUNT_TOKEN: ${{ secrets.OP_SERVICE_ACCOUNT_TOKEN }}
        run: |
          op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml
          dart run monolith_runner:install
          dart run monolith_runner:define
          dart run monolith_runner:xcodegen
          
      - name: Build iOS
        run: flutter build ios --dart-define-from-file=secrets/dart-define/production.json
```

## Additional information

This runner package is designed to streamline development workflows:

**Developer Experience Improvements**:
- **Unified Command System**: Easy-to-remember and consistent command naming
- **Incremental Execution**: Individual execution of only necessary features
- **Batch Execution**: Automated development environment setup

**CI/CD Environment Benefits**:
- **Error Handling**: Appropriate error codes and messages on failure
- **Log Output**: Clear display of progress and results

**Project Integration**:
- **Lightweight Integration**: Access to all features through dev_dependencies only
- **Configuration File Sharing**: Common use of `monolith.yaml` in project root
- **Version Management**: Centralized version management for monolith features

Streamlines the entire process from development to release as a unified entry point to maximize the utilization of the monolith library suite. 