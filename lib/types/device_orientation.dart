import 'dart:async';
import 'dart:js_interop';

import 'package:async/async.dart';
import '../telegram_miniapp.dart';

part './device_orientation_start_params.dart';

const _deviceOrientationPath = "$webAppPath.DeviceOrientation";

@JS("$_deviceOrientationPath.isStarted")
external bool get _isStarted;

@JS("$_deviceOrientationPath.absolute")
external bool get _absolute;

@JS("$_deviceOrientationPath.alpha")
external double get _alpha;

@JS("$_deviceOrientationPath.beta")
external double get _beta;

@JS("$_deviceOrientationPath.gamma")
external double get _gamma;

@JS("$_deviceOrientationPath.start")
external void _start(
    DeviceOrientationStartParamsExternal params, JSFunction? callback);

@JS("$_deviceOrientationPath.stop")
external void _stop(JSFunction? callback);

class DeviceOrientation {
  bool get isStarted => _isStarted;

  bool get absolute => _absolute;

  double get alpha => _alpha;
  double get beta => _beta;
  double get gamma => _gamma;

  void start(
          {required DeviceOrientationStartParams params,
          void Function(bool result)? callback}) =>
      _start(params._toExt, callback?.toJS);

  Future<bool> startAsync(
      {required DeviceOrientationStartParams params}) async {
    StreamController<bool> streamController = StreamController();
    void callback(JSBoolean result) => streamController.add(result.toDart);

    _start(params._toExt, callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  void stop({void Function(bool result)? callback}) => _stop(callback?.toJS);

  Future<bool> stopAsync() async {
    StreamController<bool> streamController = StreamController();
    void callback(JSBoolean result) => streamController.add(result.toDart);

    _stop(callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }
}
