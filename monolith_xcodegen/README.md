A package that supports iOS project generation using `xcodegen`.
Based on `monolith.yaml` configuration, it automates environment variable injection and file creation,
providing Xcode project generation optimized for Flutter projects.

## Features

* **Automatic Project Generation**: Automatic Xcode project generation from xcodegen YAML files
* **Environment Variable Injection**: Environment variable settings in conjunction with secret management tools like 1Password
* **Required File Creation**: Pre-creation and touch processing of files necessary for builds
* **Flutter Optimization**: Project settings adapted to Flutter project structures

## Getting started

Describe the configuration in the `xcodegen` section of `monolith.yaml` and install the `xcodegen` tool in advance.

```bash
# Install xcodegen
brew install xcodegen
```

## Usage

**Basic Configuration Example** (`monolith.yaml`):
```yaml
xcodegen:
  # Required: Target package name
  package_name: app
  
  # Optional: Files that need to be created in advance
  touch_files:
    - ios/GoogleService-Info.plist
    - ios/firebase_app_id_file.json
  
  # Optional: Environment variables for xcodegen execution
  env:
    DEVELOPMENT_TEAM: ABCD123456
    CODE_SIGN_IDENTITY: iPhone Developer
```

**Integration with Secret Management Example**:
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

**Execution Example and Log Output**:
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

**Generated Xcode Project Features**:
- Proper integration settings with Flutter framework
- Automatic recognition of environment-specific configuration files
- Project settings using environment variables

## Additional information

This package supports the following workflows:

**Benefits for Development Teams**:
- **Environment Standardization**: All developers share identical Xcode project settings
- **Environment Variable Injection**: Flexible configuration management through integration with external configuration tools
- **Automation**: Automatic project generation in CI/CD environments

**Examples of Supported Environment Variables**:
- `DEVELOPMENT_TEAM`: Apple Developer Team ID
- `CODE_SIGN_IDENTITY`: Code signing identity
- `BUNDLE_ID_SUFFIX`: Bundle Identifier suffix
- Any other environment variables required for xcodegen execution

**Prerequisites**:
- `xcodegen` tool must be installed on the system
- `project.yml` file must exist in the target package
- Appropriate `xcodegen` configuration must be described in `monolith.yaml`

**Troubleshooting**:
- If files are not found: Check pre-creation with `touch_files` setting
- If environment variables are not reflected: Check `env` setting in `monolith.yaml`
- If project generation fails: Check syntax errors in `project.yml`

It bridges Flutter and native platform development, significantly improving development efficiency by automating complex configuration management in iOS development. 