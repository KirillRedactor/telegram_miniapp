part of './biometric_manager.dart';

@JSExport()
class BiometricRequestAccessParams {
  String reason;

  BiometricRequestAccessParams(this.reason);

  BiometricRequestAccessParamsExternal get _toExt =>
      createJSInteropWrapper<BiometricRequestAccessParams>(this)
          as BiometricRequestAccessParamsExternal;
}

extension type BiometricRequestAccessParamsExternal(JSObject _)
    implements JSObject {
  external String reason;
}
