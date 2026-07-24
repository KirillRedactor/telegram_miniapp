import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';
import '../internal/js_async.dart';

const _secureStoragePath = "$webAppPath.SecureStorage";

@JS("$_secureStoragePath.setItem")
external void _setItem(JSString key, JSString value, JSFunction callback);

@JS("$_secureStoragePath.getItem")
external void _getItem(JSString key, JSFunction callback);

@JS("$_secureStoragePath.restoreItem")
external void _restoreItem(JSString key, JSFunction callback);

@JS("$_secureStoragePath.removeItem")
external void _removeItem(JSString key, JSFunction? callback);

@JS("$_secureStoragePath.clear")
external void _clear(JSFunction? callback);

/// This object provides access to a secure, hardware-backed storage on the
/// user's device.
///
/// [API Reference](https://core.telegram.org/bots/webapps#securestorage)
class SecureStorage {
  /// Stores the [value] under the given [key]. Returns whether the value was
  /// stored. Throws a [TelegramMiniAppException] if the operation fails.
  Future<bool> setItem({required String key, required String value}) =>
      completeNodeCallback(
        (result) => (result as JSBoolean?)?.toDart ?? false,
        (callback) => _setItem(key.toJS, value.toJS, callback),
      );

  /// Returns the value stored under [key], or `null` if it is absent. Throws a
  /// [TelegramMiniAppException] if the operation fails.
  Future<String?> getItem({required String key}) => completeNodeCallback(
    (result) => (result as JSString?)?.toDart,
    (callback) => _getItem(key.toJS, callback),
  );

  /// Attempts to restore a value previously removed from this device. Returns
  /// the restored value, or `null` if it cannot be restored. Throws a
  /// [TelegramMiniAppException] if the operation fails.
  Future<String?> restoreItem({required String key}) => completeNodeCallback(
    (result) => (result as JSString?)?.toDart,
    (callback) => _restoreItem(key.toJS, callback),
  );

  /// Removes the value stored under [key]. Returns whether the value was
  /// removed. Throws a [TelegramMiniAppException] if the operation fails.
  Future<bool> removeItem({required String key}) => completeNodeCallback(
    (result) => (result as JSBoolean?)?.toDart ?? false,
    (callback) => _removeItem(key.toJS, callback),
  );

  /// Removes all values stored for the current user. Returns whether the
  /// storage was cleared. Throws a [TelegramMiniAppException] if the operation
  /// fails.
  Future<bool> clear() => completeNodeCallback(
    (result) => (result as JSBoolean?)?.toDart ?? false,
    (callback) => _clear(callback),
  );
}
