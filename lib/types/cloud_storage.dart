import 'dart:async';
import 'dart:js_interop';

import 'package:async/async.dart';
import '../telegram_miniapp.dart';

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

class CloudStorage {
  void setItem(
      {required String key,
      required String value,
      void Function(bool result)? callback}) {
    void callbackFunction(JSString? error, JSBoolean? result) {
      // if (error != null) debugPrint("Error: ${error.toDart}");
      if (callback != null) callback(result?.toDart ?? false);
    }

    return _setItem(key.toJS, value.toJS, callbackFunction.toJS);
  }

  Future<bool> setItemAsync(
      {required String key, required String value}) async {
    StreamController<bool> streamController = StreamController();
    void callback(JSString? error, JSBoolean? result) {
      // if (error != null) debugPrint("Error: ${error.toDart}");
      streamController.add(result?.toDart ?? false);
    }

    _setItem(key.toJS, value.toJS, callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  void getItem(
      {required String key, required void Function(String? result) callback}) {
    void callbackFunction(JSString? error, JSString? result) {
      // if (error != null) debugPrint("Error: ${error.toDart}");
      callback(result?.toDart);
    }

    _getItem(
      key.toJS,
      callbackFunction.toJS,
    );
  }

  Future<String?> getItemAsync({required String key}) async {
    StreamController<String?> streamController = StreamController();
    void callback(JSString? error, JSString? result) {
      // if (error != null) debugPrint("Error: ${error.toDart}");
      streamController.add(result?.toDart);
    }

    _getItem(key.toJS, callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  void getItems(
      {required List<String> keys,
      required void Function(Map<String, String?> result) callback}) {
    Map<String, String?> result = {};
    for (var key in keys) {
      callbackFunction(String? value) => result[key] = value;
      getItem(key: key, callback: callbackFunction);
    }
    callback(result);
  }

  Future<Map<String, String?>> getItemsAsync(
      {required List<String> keys}) async {
    Map<String, Future<String?>> futures = {};
    Map<String, String?> result = {};
    for (var key in keys) {
      futures[key] = getItemAsync(key: key);
    }
    for (var key in futures.keys) {
      result[key] = await futures[key];
    }
    return result;
  }

  void removeItem(
      {required String key, void Function(bool? result)? callback}) {
    void callbackFunction(JSString? error, JSBoolean? result) {
      // if (error != null) debugPrint("Error: ${error.toDart}");
      if (callback != null) callback(result?.toDart);
    }

    _removeItem(key.toJS, callbackFunction.toJS);
  }

  Future<bool> removeItemAsync(
      {required String key, required String value}) async {
    StreamController<bool> streamController = StreamController();
    void callback(JSString? error, JSBoolean? result) {
      // if (error != null) debugPrint("Error: ${error.toDart}");
      streamController.add(result?.toDart ?? false);
    }

    _removeItem(key.toJS, callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  void removeItems(
      {required List<String> key, void Function(bool? result)? callback}) {
    void callbackFunction(JSString? error, JSBoolean? result) {
      // if (error != null) debugPrint("Error: ${error.toDart}");
      if (callback != null) callback(result?.toDart);
    }

    _removeItems(key.map((e) => e.toJS).toList().toJS, callbackFunction.toJS);
  }

  Future<bool> removeItemsAsync(
      {required List<String> key, required String value}) async {
    StreamController<bool> streamController = StreamController();
    void callback(JSString? error, JSBoolean? result) {
      // if (error != null) debugPrint("Error: ${error.toDart}");
      streamController.add(result?.toDart ?? false);
    }

    _removeItems(key.map((e) => e.toJS).toList().toJS, callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  void getKeys({required void Function(List<String>? result)? callback}) {
    void callbackFunction(JSString? error, JSArray<JSString>? result) {
      // if (error != null) debugPrint("Error: ${error.toDart}");
      if (callback != null) {
        callback(result?.toDart.map((e) => e.toDart).toList());
      }
    }

    _getKeys(callbackFunction.toJS);
  }

  Future<List<String>> getKeysAsync() async {
    StreamController<List<String>> streamController = StreamController();
    void callback(JSString? error, JSArray<JSString>? result) {
      // if (error != null) debugPrint("Error: ${error.toDart}");
      streamController
          .add(result?.toDart.map((e) => e.toDart).toList() ?? <String>[]);
    }

    _getKeys(callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }
}
