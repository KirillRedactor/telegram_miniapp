import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

part 'accelerometer_start_params.dart';

const _accelerometerPath = "$webAppPath.Accelerometer";

@JS("$_accelerometerPath.isStarted")
external bool get _isStarted;

@JS("$_accelerometerPath.x")
external double get _x;

@JS("$_accelerometerPath.y")
external double get _y;

@JS("$_accelerometerPath.z")
external double get _z;

@JS("$_accelerometerPath.start")
external void _start(
    AccelerometerStartParamsExternal params, JSFunction? callback);

@JS("$_accelerometerPath.stop")
external void _stop(JSFunction? callback);

class Accelerometer {
  bool get isStarted => _isStarted;

  double get x => _x;
  double get y => _y;
  double get z => _z;

  void start(
          {required AccelerometerStartParams params,
          void Function(bool result)? callback}) =>
      _start(params._toExt, callback?.toJS);

  Future<bool> startAsync({required AccelerometerStartParams params}) async {
    Completer<bool> completer = Completer();
    void callback(JSBoolean result) => completer.complete(result.toDart);

    _start(params._toExt, callback.toJS);
    return await completer.future;
  }

  void stop({void Function(bool result)? callback}) => _stop(callback?.toJS);

  Future<bool> stopAsync() async {
    Completer<bool> completer = Completer();
    void callback(JSBoolean result) => completer.complete(result.toDart);

    _stop(callback.toJS);
    return await completer.future;
  }
}
