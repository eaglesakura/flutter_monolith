A package that securely deploys files to the workspace from data retrieved from secret management tools such as the `op inject` command.
It integrates with secret management tools like 1Password and AWS Secrets Manager to automate the distribution of sensitive files.

## Features

* **Base64 File Deployment**: Decode and deploy encoded binary files
* **Text File Generation**: Dynamic generation of configuration files and property files
* **Secret Management Tool Integration**: Automatic integration with 1Password CLI, AWS CLI, etc.
* **Secure Distribution**: Safe distribution method that doesn't include sensitive files in version control

## Getting started

Define the files to be deployed in the `install` section of `monolith.yaml`.
Retrieve secret data using the `op inject` command beforehand and execute the deployment process.

```bash
# Inject secret data with 1Password CLI
op inject --force --in-file monolith.yaml --out-file secrets/monolith.yaml

# Execute file deployment process
dart run monolith_install
```

## Usage

**Android development file deployment example**:
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

**iOS development file deployment example**:
```yaml
install:
  # Environment-specific GoogleService-Info.plist
  - path: app/ios/Configurations/Debug-development/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-debug-dev.plist.base64
  
  - path: app/ios/Configurations/Release-production/GoogleService-Info.plist
    base64_file: op://vault-id/google-services/ios-release-prod.plist.base64
```

## Additional information

This package is designed to safely share sensitive files among development teams without including them in version control systems.

**Supported deployment formats**:
- `base64_file`: Base64-encoded binary files
- `text_file`: Plain text files (with environment variable expansion support)

**Security requirements**:
- Deployed files should be excluded by `.gitignore`
- Properly manage access permissions to secret management tools
- Configure appropriate authentication credentials in CI/CD environments

Optimized for distributing sensitive files commonly used in mobile app development, such as Keystore files, certificates, and API configuration files. 

**Version Compatibility**: This package maintains compatibility with the latest monolith ecosystem, ensuring reliable integration across all project management features. 