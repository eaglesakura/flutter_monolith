A package that safely deploys files to workspaces from data obtained from secret management tools like `op inject` command.
It integrates with secret management tools such as 1Password and AWS Secrets Manager to automate distribution of confidential files.

## Features

* **Base64 File Deployment**: Decode and place encoded binary files
* **Text File Generation**: Dynamic generation of configuration files and property files
* **Secret Management Tool Integration**: Automatic integration with 1Password CLI, AWS CLI, etc.
* **Secure Distribution**: Safe distribution method that doesn't include confidential files in version control

## Getting started

Define files to be deployed in the `install` section of `monolith.yaml`.
Execute the deployment process after obtaining secret data with the `op inject` command in advance.

```bash
# Inject secret data with 1Password CLI
op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml

# Execute file deployment process
dart run monolith_install
```

## Usage

**Android Development File Deployment Example**:
```yaml
# monolith.yaml
install:
  # Android Keystore (Base64 encoded)
  - path: secrets/android.keystore
    base64_file: op://vault-id/item-id/section/field.base64
  
  # Android configuration file (Text)
  - path: secrets/android.properties
    text_file: |
      android.projectName = MyApp
      android.applicationId = com.example.myapp
      android.keystore.password = op://vault-id/item-id/password
  
  # Google Services configuration file
  - path: app/android/app/src/production/google-services.json
    base64_file: op://vault-id/google-services/production.json.base64
```

**iOS Development File Deployment Example**:
```yaml
install:
  # Environment-specific GoogleService-Info.plist
  - path: app/ios/Configurations/Debug-development/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-debug-dev.plist.base64
  
  - path: app/ios/Configurations/Release-production/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-release-prod.plist.base64
```

## Additional information

This package is designed to safely share confidential files among development teams without including them in version control systems.

**Supported Deployment Formats**:
- `base64_file`: Base64 encoded binary files
- `text_file`: Plain text files (with environment variable expansion support)

**Security Requirements**:
- Deployed files should be excluded in `.gitignore`
- Properly manage access permissions to secret management tools
- Set appropriate authentication credentials in CI/CD environments

It's optimized for distributing confidential files commonly used in mobile app development, such as Keystore files, certificates, and API configuration files.

**Version Compatibility**: This package maintains compatibility with the latest monolith ecosystem and ensures reliable integration with all project management features. 