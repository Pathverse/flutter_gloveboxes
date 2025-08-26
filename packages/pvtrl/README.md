# pvtrl

Pathverse Translate Lite - A minimal translation constants library.

## What it does

Provides common UI constants in 13 languages. No setup required.

## Usage

```dart
import 'package:pvtrl/pvtrl.dart';

// Use translations
Text(pvtrl.common.message.loading)
Text(pvtrl.common.control.save)
Text(pvtrl.login.form.username)
```

## Languages

English, Spanish, French, Danish, Dutch, Swedish, Norwegian, Korean, Chinese, Hebrew, Icelandic.

## Installation

```yaml
dependencies:
  pvtrl:
    git:
      url: https://github.com/Pathverse/flutter_gloveboxes
      path: packages/pvtrl