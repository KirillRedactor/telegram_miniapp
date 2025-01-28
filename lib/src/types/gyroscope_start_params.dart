part of 'gyroscope.dart';

@JSExport()
class GyroscopeStartParams {
  // ignore: non_constant_identifier_names
  int refresh_rate;

  GyroscopeStartParams({required int refreshRate}) : refresh_rate = refreshRate;

  GyroscopeStartParamsExternal get _toExt =>
      createJSInteropWrapper<GyroscopeStartParams>(this)
          as GyroscopeStartParamsExternal;
}

extension type GyroscopeStartParamsExternal(JSObject _) implements JSObject {
  // ignore: non_constant_identifier_names
  external int refresh_rate;
}
