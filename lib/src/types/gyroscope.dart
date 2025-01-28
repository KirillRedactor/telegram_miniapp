import 'dart:async';
import 'dart:js_interop';

import 'package:async/async.dart';
import '../../telegram_miniapp.dart';

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

  void start(
          {required GyroscopeStartParams params,
          void Function(bool result)? callback}) =>
      _start(params._toExt, callback?.toJS);

  Future<bool> startAsync({required GyroscopeStartParams params}) async {
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
