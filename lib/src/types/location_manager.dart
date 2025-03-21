import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

part 'location_data.dart';

const _locationManagerPath = "$webAppPath.LocationManager";

@JS("$_locationManagerPath.isInited")
external bool get _isInited;

@JS("$_locationManagerPath.isLocationAvailable")
external bool get _isLocationAvailable;

@JS("$_locationManagerPath.isAccessRequested")
external bool get _isAccessRequested;

@JS("$_locationManagerPath.isAccessGranted")
external bool get _isAccessGranted;

@JS("$_locationManagerPath.init")
external void _init(JSFunction? callback);

@JS("$_locationManagerPath.getLocation")
external void _getLocation(JSFunction callback);

@JS("$_locationManagerPath.openSettings")
external void _openSettings();

class LocationManager {
  bool get isInited => _isInited;

  bool get isLocationAvailable => _isLocationAvailable;

  bool get isAccessRequested => _isAccessRequested;

  bool get isAccessGranted => _isAccessGranted;

  void init({void Function()? callback}) => _init(callback?.toJS);
  Future<bool> initAsync() async {
    Completer<bool> completer = Completer();
    void callback() => completer.complete(true);

    _init(callback.toJS);
    return await completer.future;
  }

  void getLocation(
      {required void Function(LocationData locationData) callback}) {
    void callbackFunction(LocationDataExternal ext) =>
        callback(LocationData.fromExternal(ext));
    _getLocation(callbackFunction.toJS);
  }

  Future<LocationData> getLocationAsync() async {
    Completer<LocationData> completer = Completer();
    void callback(LocationDataExternal ext) =>
        completer.complete(LocationData.fromExternal(ext));

    _getLocation(callback.toJS);
    return await completer.future;
  }

  void openSettings() => _openSettings();
}
