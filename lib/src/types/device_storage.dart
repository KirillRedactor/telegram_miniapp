import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';
import '../internal/js_async.dart';

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
class DeviceStorage {
  /// `Bot API 9.0+` Stores the [value] under the given [key]. Returns whether
  /// the value was stored. Throws a [TelegramMiniAppException] if the operation
  /// fails.
  ///
  /// [API Reference](https://core.telegram.org/bots/webapps#devicestorage)
  Future<bool> setItem({required String key, required String value}) =>
      completeNodeCallback(
        (result) => (result as JSBoolean?)?.toDart ?? false,
        (callback) => _setItem(key.toJS, value.toJS, callback),
      );

  /// `Bot API 9.0+` Returns the value stored under [key], or `null` if it is
  /// absent. Throws a [TelegramMiniAppException] if the operation fails.
  ///
  /// [API Reference](https://core.telegram.org/bots/webapps#devicestorage)
  Future<String?> getItem({required String key}) => completeNodeCallback(
    (result) => (result as JSString?)?.toDart,
    (callback) => _getItem(key.toJS, callback),
  );

  /// `Bot API 9.0+` Removes the value stored under [key]. Returns whether the
  /// value was removed. Throws a [TelegramMiniAppException] if the operation
  /// fails.
  ///
  /// [API Reference](https://core.telegram.org/bots/webapps#devicestorage)
  Future<bool> removeItem({required String key}) => completeNodeCallback(
    (result) => (result as JSBoolean?)?.toDart ?? false,
    (callback) => _removeItem(key.toJS, callback),
  );

  /// `Bot API 9.0+` Removes all values stored for the current user. Returns
  /// whether the storage was cleared. Throws a [TelegramMiniAppException] if
  /// the operation fails.
  ///
  /// [API Reference](https://core.telegram.org/bots/webapps#devicestorage)
  Future<bool> clear() => completeNodeCallback(
    (result) => (result as JSBoolean?)?.toDart ?? false,
    (callback) => _clear(callback),
  );
}
