part of 'biometric_manager.dart';

@JSExport()
class BiometricAuthenticateParams {
  String reason;

  BiometricAuthenticateParams(this.reason);

  BiometricAuthenticateParamsExternal get _toExt =>
      createJSInteropWrapper<BiometricAuthenticateParams>(this)
          as BiometricAuthenticateParamsExternal;
}

extension type BiometricAuthenticateParamsExternal(JSObject _)
    implements JSObject {
  external String reason;
}
