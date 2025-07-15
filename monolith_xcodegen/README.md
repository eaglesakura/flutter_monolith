A package that supports iOS project generation using `xcodegen`.
It provides Xcode project generation optimized for Flutter projects by automating environment variable injection and file creation based on `monolith.yaml` configuration.

## Features

* **Automatic Project Generation**: Automatically generate Xcode projects from xcodegen YAML files
* **Environment Variable Injection**: Environment variable configuration in collaboration with secret management tools like 1Password
* **Required File Creation**: Pre-creation and touch processing of files needed for build
* **Flutter Optimization**: Project settings adapted to Flutter project structure

## Getting started

Configure the `xcodegen` section in `monolith.yaml` and install the `xcodegen` tool in advance.

```bash
# Install xcodegen
brew install xcodegen
```

## Usage

**Basic configuration example** (`monolith.yaml`):
```yaml
xcodegen:
  # Required: target package name
  package_name: app
  
  # Optional: files that need to be created in advance
  touch_files:
    - ios/GoogleService-Info.plist
    - ios/firebase_app_id_file.json
  
  # Optional: environment variables for xcodegen execution
  env:
    DEVELOPMENT_TEAM: ABCD123456
    CODE_SIGN_IDENTITY: iPhone Developer
```

**Integration example with secret management**:
```yaml
xcodegen:
  package_name: app
  touch_files:
    - ios/GoogleService-Info.plist
  env:
    # Environment variable injection from 1Password CLI
    DEVELOPMENT_TEAM: op://vault-id/apple-dev/team-id
    PROVISIONING_PROFILE_UUID: op://vault-id/provisioning/profile-uuid
    BUNDLE_ID_SUFFIX: op://vault-id/app-config/bundle-suffix
```

**Execution example and log output**:
```bash
$ dart run monolith:xcodegen

xcodegen
  - package: app
  - touchFiles: ios/GoogleService-Info.plist
  - env: DEVELOPMENT_TEAM

touch: ios/GoogleService-Info.plist
Running xcodegen in app/ios/
✓ Xcode project generated successfully
```

**Generated Xcode project features**:
- Proper integration settings with Flutter framework
- Automatic recognition of environment-specific configuration files
- Project configuration using environment variables

## Additional information

This package supports the following workflows:

**Benefits for development teams**:
- **Environment Standardization**: All developers share identical Xcode project settings
- **Environment Variable Injection**: Flexible configuration management through integration with external configuration tools
- **Automation**: Automatic project generation in CI/CD environments

**Examples of supported environment variables**:
- `DEVELOPMENT_TEAM`: Apple Developer Team ID
- `CODE_SIGN_IDENTITY`: Code signing identity
- `BUNDLE_ID_SUFFIX`: Bundle Identifier suffix
- Any other environment variables needed for xcodegen execution

**Prerequisites**:
- `xcodegen` tool must be installed on the system
- `project.yml` file must exist in the target package
- Appropriate `xcodegen` configuration must be described in `monolith.yaml`

**Troubleshooting**:
- If files are not found: Check `touch_files` configuration for pre-creation
- If environment variables are not reflected: Check `env` configuration in `monolith.yaml`
- If project generation fails: Check `project.yml` for syntax errors

Bridges Flutter and native platform development, significantly improving development efficiency by automating complex configuration management in iOS development. 