# PV WebEnv

A flexible configuration management package for Flutter applications that supports multiple file formats and dynamic file references.

## Features

- **Multiple Format Support**: Load configurations from ENV, JSON, and TOML files
- **File References**: Use `{{filename}}` patterns to reference and merge other configuration files
- **Prefix Support**: Use `<<filename>>` patterns to load files with automatic key prefixing
- **Asset-Based Loading**: Load configurations from Flutter assets at runtime
- **Singleton Access**: Global access to configuration values with `env['key']`
- **Deep Merging**: Automatic merging of nested configuration structures
- **Type Preservation**: Maintains data types (int, double, bool, string) from original files

## Getting Started

Add `pv_webenv` to your `pubspec.yaml`:

```yaml
dependencies:
  pv_webenv: ^0.0.1
```

Add your configuration files to `envs/` directory at the root of your project and declare them in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - envs/
```

## Usage

### Basic Setup

Create a `root.env` file in your `envs/` directory:

```env
# envs/root.env
APP_NAME=My Flutter App
APP_VERSION=1.0.0
DEBUG_MODE=true
MAX_RETRIES=3
TIMEOUT_SECONDS=30
```

Initialize and use the environment in your Flutter app:

```dart
import 'package:pv_webenv/lib.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize the environment
  await env.init();
  
  // Access configuration values
  print(env['APP_NAME']);        // "My Flutter App"
  print(env['DEBUG_MODE']);      // "true"
  print(env['MAX_RETRIES']);     // "3"
  
  runApp(MyApp());
}
```

### File References

#### Direct Merge with {{file}} Syntax

Use `{{filename}}` patterns to reference and directly merge other configuration files:

```env
# envs/root.env
APP_NAME=My App
DATABASE_CONFIG={{database.json}}
API_CONFIG={{api.toml}}
```

#### Prefixed Merge with <<file>> Syntax

Use `<<filename>>` patterns to load configuration files with automatic key prefixing:

```env
# envs/root.env
APP_NAME=My App
DB={{database.env}}
AUTH={{auth.json}}
MONITOR={{monitoring.toml}}
```

```json
// envs/database.json
{
  "host": "localhost",
  "port": 5432,
  "credentials": {
    "username": "user",
    "password": "pass"
  }
}
```

```toml
# envs/api.toml
[api]
base_url = "https://api.example.com"
timeout = 60
enabled = true

[api.auth]
type = "bearer"
token_url = "/auth/token"
```

After initialization, configurations are merged according to their syntax:

```dart
await env.init();

// Access values from {{file}} direct merges
print(env['APP_NAME']);                           // "My App"
print(env.env['host']);                          // "localhost" (from database.json)
print(env.env['api']['base_url']);               // "https://api.example.com" (from api.toml)

// Access values from <<file>> prefixed merges
print(env.env['DB_DB_HOST']);                    // "localhost" (from database.env with DB_ prefix)
print(env.env['AUTH_jwt_secret']);               // "secret_key" (from auth.json with AUTH_ prefix)
print(env.env['MONITOR_enabled']);               // "true" (from monitoring.toml with MONITOR_ prefix)

// File reference keys are removed after processing
print(env['DATABASE_CONFIG']);                   // null
print(env['API_CONFIG']);                       // null
print(env['DB']);                               // null
print(env['AUTH']);                             // null
print(env['MONITOR']);                          // null
```

#### Prefix Example

If you have `DB=<<database.env>>` and `database.env` contains:

```env
# envs/database.env
HOST=localhost
PORT=5432
NAME=mydb
```

The result will be:

```dart
// All keys get the DB_ prefix
env.env['DB_HOST']     // "localhost"
env.env['DB_PORT']     // "5432"
env.env['DB_NAME']     // "mydb"
```

### Supported File Formats

#### ENV Files (.env)
```env
KEY=value
NUMERIC_VALUE=123
BOOLEAN_VALUE=true
# Comments are supported
```

#### JSON Files (.json)
```json
{
  // Comments are supported
  "nested": {
    "key": "value",
    "number": 42,
    "boolean": true
  }
}
```

#### TOML Files (.toml)
```toml
# Section headers create nested objects
[database]
host = "localhost"
port = 5432
enabled = true

[database.credentials]
username = "user"
password = "pass"
```

## API Reference

### ENV Class

- `env.init()` - Initialize and load all configurations
- `env['key']` - Access top-level configuration values
- `env.env` - Access the complete configuration map
- `ENV.reset()` - Reset the singleton (useful for testing)

## Testing

The package includes comprehensive testing patterns. See the `pv_webenv_test` package for integration test examples.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
