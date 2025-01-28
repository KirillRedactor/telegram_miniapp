part of './device_orientation.dart';

@JSExport()
class DeviceOrientationStartParams {
  // ignore: non_constant_identifier_names
  int refresh_rate;
  // ignore: non_constant_identifier_names
  bool need_absolute;

  DeviceOrientationStartParams(
      {int refreshRate = 1000, bool needAbsolute = false})
      : refresh_rate = refreshRate,
        need_absolute = needAbsolute;

  DeviceOrientationStartParamsExternal get _toExt =>
      createJSInteropWrapper<DeviceOrientationStartParams>(this)
          as DeviceOrientationStartParamsExternal;
}

extension type DeviceOrientationStartParamsExternal(JSObject _)
    implements JSObject {
  // ignore: non_constant_identifier_names
  external int refresh_rate;
  // ignore: non_constant_identifier_names
  external bool need_absolute;
}
