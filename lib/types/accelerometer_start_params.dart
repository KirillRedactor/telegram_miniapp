part of './accelerometer.dart';

@JSExport()
class AccelerometerStartParams {
  // ignore: non_constant_identifier_names
  int refresh_rate;

  AccelerometerStartParams({required int refreshRate})
      : refresh_rate = refreshRate;

  AccelerometerStartParamsExternal get _toExt =>
      createJSInteropWrapper<AccelerometerStartParams>(this)
          as AccelerometerStartParamsExternal;
}

extension type AccelerometerStartParamsExternal(JSObject _)
    implements JSObject {
  // ignore: non_constant_identifier_names
  external int refresh_rate;
}
