import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

const _deviceStoragePath = "$webAppPath.DeviceStorage";

@JS("$_deviceStoragePath.setItem")
external void _setItem(JSString key, JSString value, JSFunction callback);

@JS("$_deviceStoragePath.getItem")
external void _getItem(JSString key, JSFunction callback);

@JS("$_deviceStoragePath.removeItem")
external void _removeItem(JSString key, JSFunction? callback);

@JS("$_deviceStoragePath.clear")
external void _clear(JSFunction? callback);

/// This object provides access to persistent local storage on the user’s device.
/// It is conceptually similar to the browser's `localStorage` API, but integrated
/// within the Telegram client. All data is stored locally and is available only
/// to the bot that created it. Each bot can store up to **5 MB per user** using this storage.
///
/// [API Reference](https://core.telegram.org/bots/webapps#devicestorage)
class CloudStorage {
  /// `Bot API 9.0+` A method that stores a value in the device's local storage
  /// using the specified key. If an optional callback parameter was passed,
  /// the *callback* function will be called. In case of an error, the first
  /// argument will contain the error. In case of success, the first argument
  /// will be null and the second argument will be a boolean indicating whether
  /// the value was stored.
  ///
  /// [API Reference](https://core.telegram.org/bots/webapps#devicestorage)
  void setItem(
      {required String key,
      required String value,
      void Function(bool result)? callback}) {
    void callbackFunction(JSString? error, JSBoolean? result) {
      if (callback != null) callback(result?.toDart ?? false);
    }

    return _setItem(key.toJS, value.toJS, callbackFunction.toJS);
  }

  /// `Bot API 9.0+` A method that stores a value in the device's local storage
  /// using the specified key. If an optional callback parameter was passed,
  /// the *callback* function will be called. In case of an error, the first
  /// argument will contain the error. In case of success, the first argument
  /// will be null and the second argument will be a boolean indicating whether
  /// the value was stored.
  ///
  /// [API Reference](https://core.telegram.org/bots/webapps#devicestorage)
  Future<bool> setItemAsync(
      {required String key, required String value}) async {
    Completer<bool> completer = Completer();
    void callback(JSString? error, JSBoolean? result) {
      completer.complete(result?.toDart ?? false);
    }

    _setItem(key.toJS, value.toJS, callback.toJS);
    return await completer.future;
  }

  void getItem(
      {required String key, required void Function(String? result) callback}) {
    void callbackFunction(JSString? error, JSString? result) {
      callback(result?.toDart);
    }

    _getItem(
      key.toJS,
      callbackFunction.toJS,
    );
  }

  Future<String?> getItemAsync({required String key}) async {
    Completer<String?> completer = Completer();
    void callback(JSString? error, JSString? result) {
      completer.complete(result?.toDart);
    }

    _getItem(key.toJS, callback.toJS);
    return await completer.future;
  }

  void removeItem(
      {required String key, void Function(bool? result)? callback}) {
    void callbackFunction(JSString? error, JSBoolean? result) {
      if (callback != null) callback(result?.toDart);
    }

    _removeItem(key.toJS, callbackFunction.toJS);
  }

  Future<bool> removeItemAsync(
      {required String key, required String value}) async {
    Completer<bool> completer = Completer();
    void callback(JSString? error, JSBoolean? result) {
      completer.complete(result?.toDart ?? false);
    }

    _removeItem(key.toJS, callback.toJS);
    return await completer.future;
  }

  void clear({required void Function(bool? result)? callback}) {
    void callbackFunction(JSString? error, JSBoolean? result) {
      if (callback != null) {
        callback(result?.toDart);
      }
    }

    _clear(callbackFunction.toJS);
  }

  Future<bool> clearAsync() async {
    Completer<bool> completer = Completer();
    void callback(JSString? error, JSBoolean? result) {
      completer.complete(result?.toDart ?? false);
    }

    _clear(callback.toJS);
    return await completer.future;
  }
}
