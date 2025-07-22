# Flutter Monolith

![Flutter Monolith](./docs/res/monolith_logo.png)

An integrated project management toolset that supports modular monolith structures for Flutter projects.
It efficiently manages multiple packages in large-scale Flutter application development,
automating the entire process from development environment setup to production releases.

## 🚀 Challenges Solved

Large-scale Flutter projects face the following challenges:

**Complex Environment Management**
- Cumbersome configuration management for different flavors
- Version control issues with confidential files
- Inconsistent environment setup among developers

**Localization Limitations**
- Flutter's standard internationalization features are only at the application level
- Difficult to implement independent localization per package
- Cannot separate domain logic from translation resources

**iOS Development Complexity**
- Manual management of Xcode project settings
- Distribution of certificates and provisioning profiles
- Difficulty in sharing configurations between teams

**Inefficient Project Management**
- Tedious individual execution of each tool
- Complex configuration in CI/CD environments
- Lack of standardized development workflows

## ✨ Key Features

### 🔧 Integrated Project Management
- **monolith.yaml**: Centralized configuration management
- **Unified Runner**: Execute all features with `dart run monolith_runner:*` commands
- **CI/CD Optimization**: Automated development environment setup

### 🌍 Advanced Localization
- **Module-level Management**: Independent localization resources per package
- **CSV Management**: Multi-language resource definition in simple format
- **Type-safe Access**: Runtime guarantee through auto-generated Mixin classes

### 🔐 Secure Configuration Management
- **Secret Separation**: Exclude confidential files from version control
- **1Password Integration**: Integration with `op inject` command
- **Automatic Deployment**: Safe distribution of Base64 files and text files

### 📱 iOS Development Automation
- **xcodegen Integration**: YAML-based Xcode project generation
- **Environment Variable Injection**: Integration with secret management tools
- **File Creation**: Pre-creation of files necessary for builds

## 🚀 Quick Start

### Installation

```yaml
# pubspec.yaml
dev_dependencies:
  monolith_runner: ^1.0.0
```

### Basic Configuration

Create `monolith.yaml` in the project root:

```yaml
# monolith.yaml
includes:
  - secrets/monolith.yaml

define:
  output_path: secrets/dart-define/
  generate:
    package_name: foundation_metadata
    helper_path: lib/gen/defines.dart
  flavors:
    development:
      FLAVOR: development
      API_URL: https://api-dev.example.com
    production:
      FLAVOR: production
      API_URL: https://api.example.com

localization:
  languages:
    - ja
    - en
  app:
    package_name: app
    arb_path: lib/l10n/
  package:
    path_prefixes:
      - packages/
    resources_path: res/

xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist

install:
  - path: secrets/android.keystore
    base64_file: op://vault-id/android-keystore/keystore.base64
  - path: app/ios/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-production.plist.base64
```

### Basic Usage

```bash
# Inject secret data
op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml

# Setup development environment
dart run monolith_runner:install        # Deploy secret files
dart run monolith_runner:define         # Generate environment constants
dart run monolith_runner:localization   # Generate localization resources
dart run monolith_runner:xcodegen       # Generate Xcode project

# Build application
flutter build ios --dart-define-from-file=secrets/dart-define/production.json
```

## 📦 Package Structure

### Core Packages

| Package | Description | Purpose |
|---------|-------------|---------|
| **monolith** | Main library | Project management and task execution control |
| **monolith_runner** | Unified runner | Provides `dart run monolith_runner:*` commands |

### Feature Packages

| Package | Description | Key Features |
|---------|-------------|--------------|
| **monolith_define** | Dart Define management | Flavor-specific environment constants and JSON file generation |
| **monolith_install** | Secret file deployment | Safe distribution and deployment of confidential files |
| **monolith_localization** | Module-level localization | Package-independent multi-language resource management |
| **monolith_localization_runtime** | Localization runtime | Runtime support for generated code |
| **monolith_xcodegen** | Xcode project generation | Automated Xcode project generation using xcodegen tool |

## 🏗️ Project Structure Example

```
my_flutter_app/
├── monolith.yaml                    # Integrated configuration file
├── secrets/
│   ├── monolith.yaml               # Configuration after secret injection
│   └── dart-define/                # Generated environment constants
│       ├── development.json
│       └── production.json
├── app/                            # Main application
│   ├── lib/
│   │   ├── l10n/                   # Application-level localization
│   │   └── gen/
│   │       └── defines.dart        # Generated environment constant classes
│   └── ios/
│       └── Runner.xcodeproj        # Generated Xcode project
└── packages/                       # Domain and feature-specific packages
    ├── domain/
    │   └── user/
    │       ├── res/
    │       │   └── strings.csv     # Package-specific localization
    │       └── lib/
    │           └── gen/
    │               └── strings.dart # Generated localization classes
    └── screen/
        └── login/
            ├── res/
            │   └── strings.csv
            └── lib/
                └── gen/
                    └── strings.dart
```

## 🔄 Development Workflow

### 1. Initial Setup
```bash
# Install dependencies
dart pub get

# Setup development environment
op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml
dart run monolith_runner:install
dart run monolith_runner:define
dart run monolith_runner:localization
dart run monolith_runner:xcodegen
```

### 2. Daily Development
```bash
# Update localization resources
dart run monolith_runner:localization

# Add new environment constants
dart run monolith_runner:define

# Update iOS configurations
dart run monolith_runner:xcodegen
```

### 3. CI/CD Integration
```yaml
# .github/workflows/build.yml
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

## 🤝 Target Projects

This toolset is ideal for Flutter projects that:

- Adopt **large-scale modular monolith structures**
- Involve **multiple developers and teams** in collaboration
- Have **multi-flavor** environments (development, production, etc.)
- Require **multi-language support**
- Target **both iOS and Android** mobile applications
- Emphasize **CI/CD** automation

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details

## 🤝 Contributing

Issue reports and pull requests are welcome. For major changes,
we recommend discussing them in an Issue first.

---

By using **Flutter Monolith**, you can manage the complexity of large-scale Flutter projects
and significantly improve development efficiency. Leverage the benefits of modular monolith structure
to build scalable and maintainable Flutter applications. 