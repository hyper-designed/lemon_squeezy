# Lemon Squeezy

API: https://docs.lemonsqueezy.com/api

## Getting started

1. Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  lemon_squeezy: 
    git: 
      url: git://github.com/hyper-designed/lemon_squeezy.git
      ref: main
```

## Usage

1. Initialize the client

```dart
import 'package:lemon_squeezy/lemon_squeezy.dart';

final client = LemonSqueezyClient(
    apiKey: 'your-api-key',
    enableLogging: kDebugMode, // Logs requests and responses if true.
);
```

2. Use the client to make requests

```dart
final response = await client.products.getAllProducts();
print(response.data);
```

```dart
final response = await client.subscriptions.getAllSubscriptions();
```