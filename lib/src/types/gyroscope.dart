import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

part 'gyroscope_start_params.dart';

const _gyroscopePath = "$webAppPath.Gyroscope";

@JS("$_gyroscopePath.isStarted")
external bool get _isStarted;

@JS("$_gyroscopePath.x")
external double get _x;

@JS("$_gyroscopePath.y")
external double get _y;

@JS("$_gyroscopePath.z")
external double get _z;

@JS("$_gyroscopePath.start")
external void _start(GyroscopeStartParamsExternal params, JSFunction? callback);

@JS("$_gyroscopePath.stop")
external void _stop(JSFunction? callback);

class Gyroscope {
  bool get isStarted => _isStarted;

  double get x => _x;
  double get y => _y;
  double get z => _z;

  Future<bool> start({required GyroscopeStartParams params}) {
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
