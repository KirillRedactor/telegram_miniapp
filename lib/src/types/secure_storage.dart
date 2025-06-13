import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

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

class SecureStorage {
  void setItem(
      {required String key,
      required String value,
      void Function(bool result)? callback}) {
    void callbackFunction(JSString? error, JSBoolean? result) {
      if (callback != null) callback(result?.toDart ?? false);
    }

    return _setItem(key.toJS, value.toJS, callbackFunction.toJS);
  }

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

  void restoreItem(
      {required String key, required void Function(String? result) callback}) {
    void callbackFunction(JSString? error, JSString? result) {
      callback(result?.toDart);
    }

    _restoreItem(
      key.toJS,
      callbackFunction.toJS,
    );
  }

  Future<String?> restoreItemAsync({required String key}) async {
    Completer<String?> completer = Completer();
    void callback(JSString? error, JSString? result) {
      completer.complete(result?.toDart);
    }

    _restoreItem(key.toJS, callback.toJS);
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
