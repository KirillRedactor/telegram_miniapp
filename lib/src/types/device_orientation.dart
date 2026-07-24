import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

part 'device_orientation_start_params.dart';

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
  DeviceOrientationStartParamsExternal params,
  JSFunction? callback,
);

@JS("$_deviceOrientationPath.stop")
external void _stop(JSFunction? callback);

class DeviceOrientation {
  bool get isStarted => _isStarted;

  bool get absolute => _absolute;

  double get alpha => _alpha;
  double get beta => _beta;
  double get gamma => _gamma;

  Future<bool> start({required DeviceOrientationStartParams params}) {
    final completer = Completer<bool>();
    void callback(JSBoolean result) => completer.complete(result.toDart);

    _start(params._toExt, callback.toJS);
    return completer.future;
  }

  Future<bool> stop() {
    final completer = Completer<bool>();
    void callback(JSBoolean result) => completer.complete(result.toDart);

    _stop(callback.toJS);
    return completer.future;
  }
}
