import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';
import '../internal/js_async.dart';

const _cloudStoragePath = "$webAppPath.CloudStorage";

@JS("$_cloudStoragePath.setItem")
external void _setItem(JSString key, JSAny value, JSFunction callback);

@JS("$_cloudStoragePath.getItem")
external void _getItem(JSString key, JSFunction callback);

@JS("$_cloudStoragePath.removeItem")
external void _removeItem(JSString key, JSFunction? callback);

@JS("$_cloudStoragePath.removeItems")
external void _removeItems(JSArray<JSString> keys, JSFunction? callback);

@JS("$_cloudStoragePath.getKeys")
external void _getKeys(JSFunction callback);

/// This object controls the cloud storage. Each bot can store up to 1024 items
/// per user in the cloud storage.
///
/// [API Reference](https://core.telegram.org/bots/webapps#cloudstorage)
class CloudStorage {
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

  /// Returns the values stored under [keys], resolving all lookups in parallel.
  Future<Map<String, String?>> getItems({required List<String> keys}) async {
    final values = await Future.wait(keys.map((key) => getItem(key: key)));
    return {for (var i = 0; i < keys.length; i++) keys[i]: values[i]};
  }

  /// Removes the value stored under [key]. Returns whether the value was
  /// removed. Throws a [TelegramMiniAppException] if the operation fails.
  Future<bool> removeItem({required String key}) => completeNodeCallback(
    (result) => (result as JSBoolean?)?.toDart ?? false,
    (callback) => _removeItem(key.toJS, callback),
  );

  /// Removes the values stored under [keys]. Returns whether the values were
  /// removed. Throws a [TelegramMiniAppException] if the operation fails.
  Future<bool> removeItems({required List<String> keys}) =>
      completeNodeCallback(
        (result) => (result as JSBoolean?)?.toDart ?? false,
        (callback) =>
            _removeItems(keys.map((e) => e.toJS).toList().toJS, callback),
      );

  /// Returns all keys stored for the current user. Throws a
  /// [TelegramMiniAppException] if the operation fails.
  Future<List<String>> getKeys() => completeNodeCallback(
    (result) =>
        (result as JSArray<JSString>?)?.toDart.map((e) => e.toDart).toList() ??
        <String>[],
    (callback) => _getKeys(callback),
  );
}
