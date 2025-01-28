
# flutter_telegram_miniapp

A Flutter package for interacting with the Telegram Mini Apps API.

This package provides a convenient way to develop Telegram Mini Apps using Flutter. It handles the underlying JavaScript interop, providing you with type-safe Dart classes and methods to access the Telegram Mini Apps API.

>Ready for compilation in WASM

## Features

-   **Access to Web App API:** Provides the `WebApp` singleton class for accessing Telegram Web App API methods.
-   **Interface Control:**  Allows you to control the Mini App interface, such as colors, buttons, modals, QR-code scanner, and full-screen mode.
-   **Event Handling:**  Offers an `EventHandler` class to subscribe to various Mini App events, such as activation, deactivation, theme changes, button clicks, etc.
-   **Typed Data:** Includes strongly typed enums for various states and types, as well as classes for API parameters and responses.
-   **Asynchronous Operations:** Uses `async`/`await` with `Future` for non-blocking access to the API.
-   **JS Interop:** Employs `dart:js_interop` for direct interaction with the JavaScript API.
-   **Biometric, Sensor and Location Support:** Support for biometric authentication, accelerometer, gyroscope, and location services.
-   **Cloud storage:** Provide interface to save data in cloud storage.
-   **Share message and emoji status:** Ability to share messages and set emoji status.
-   **Extensibility:** Provides extension functions for color conversion.
-   **Well-Structured:**  Organized code into `enums`, `extensions`, and `types` folders.

## Getting started

To use this package, add `flutter_telegram_miniapp` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_telegram_miniapp: ^latest_version
```


Then, import it into your Dart code:

```dart
import 'package:flutter_telegram_miniapp/telegram_miniapp.dart';
```

## Usage

### Initialization

Before using any other method, you need to initialize the `WebApp` class.

```dart
void main() {
  try {
    WebApp().init();
    runApp(MyApp());
  } catch (e) {
    print('Error initializing Mini App: $e');
  }
}
```

### Accessing Web App API

You can access the Telegram Web App API through the `WebApp()` singleton:

```dart
final webApp = WebApp();

final colorScheme = webApp.colorScheme;

webApp.setHeaderColor(Colors.blue);

webApp.enableClosingConfirmation();

webApp.eventHandler.mainButtonClicked.listen((event) {
   print('Main button clicked');
});

final popupParams = PopupParams(
    message: "Some message",
    buttons: [
      PopupButton(text: "OK", type: PopupButtonType.ok)
    ]
);
webApp.showPopup(params: popupParams, callback: (buttonId) {
    print("Button clicked $buttonId");
});

final initData = webApp.initDataUnsafe;

print(initData.user);

```

### Working with Events

The `EventHandler` class allows you to subscribe to different events:

```dart
final eventHandler = WebApp().eventHandler;

eventHandler.themeChanged.listen((theme) {
    final (colorScheme, themeParams) = theme;
});
```

### Calling asynchronous functions

You can use asynchronous functions to get values from telegram api

```dart
final webApp = WebApp();

final result = await webApp.openInvoiceAsync(url: "Some url");
print(result);

final hasContact = await webApp.requestContactAsync();
if(hasContact){
  print("User sent contact");
}
```

<!-- ## Important Notes

-   **Telegram API Script:** Ensure that the Telegram Mini Apps API script is correctly included in your `index.html` file as described in [Telegram Mini Apps Documentation](https://core.telegram.org/bots/webapps#initializing-mini-apps). Otherwise, the package will throw an exception upon initialization.
-   **Error Handling:** Implement proper error handling, especially for asynchronous methods and potential failures within the Telegram Web App API.
-   **Null Safety:** Be mindful of nullability and use appropriate checks when working with the API. -->

## Issues and Contribution

If you encounter any issues or have suggestions for improvements, please feel free to open an issue on [GitHub](https://github.com/your-github-username/telegram_miniapp). Contributions are welcome!

## License

This project is licensed under the [MIT License](LICENSE).

