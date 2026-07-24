import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

part 'biometric_request_access_params.dart';
part 'biometric_authenticate_params.dart';

const _biometricManagerPath = "$webAppPath.MainButton";

@JS("$_biometricManagerPath.isInited")
external bool get _isInited;

@JS("$_biometricManagerPath.isBiometricAvailable")
external bool get _isBiometricAvailable;

@JS("$_biometricManagerPath.biometricType")
external String get _biometricType;

@JS("$_biometricManagerPath.isAccessRequested")
external bool get _isAccessRequested;

@JS("$_biometricManagerPath.isAccessGranted")
external bool get _isAccessGranted;

@JS("$_biometricManagerPath.isBiometricTokenSaved")
external bool get _isBiometricTokenSaved;

@JS("$_biometricManagerPath.deviceId")
external String get _deviceId;

@JS("$_biometricManagerPath.init")
external void _init(JSFunction? callback);

@JS("$_biometricManagerPath.requestAccess")
external void _requestAccess(
  BiometricRequestAccessParamsExternal params, [
  JSFunction? callback,
]);

@JS("$_biometricManagerPath.authenticate")
external void _authenticate(
  BiometricAuthenticateParamsExternal params, [
  JSFunction? callback,
]);

@JS("$_biometricManagerPath.updateBiometricToken")
external void _updateBiometricToken(JSString? token, [JSFunction? callback]);

@JS("$_biometricManagerPath.openSettings")
external void _openSettings();

class BiometricManager {
  bool get isInited => _isInited;

  bool get isBiometricAvailable => _isBiometricAvailable;

  BiometricType get biometricType => BiometricType.fromName(_biometricType);

  bool get isAccessRequested => _isAccessRequested;

  bool get isAccessGranted => _isAccessGranted;

  bool get isBiometricTokenSaved => _isBiometricTokenSaved;

  String get deviceId => _deviceId;

  Future<bool> init() {
    final completer = Completer<bool>();
    void callback() => completer.complete(true);

    _init(callback.toJS);
    return completer.future;
  }

  Future<bool> requestAccess({required BiometricRequestAccessParams params}) {
    final completer = Completer<bool>();
    void callback(JSBoolean result) => completer.complete(result.toDart);

    _requestAccess(params._toExt, callback.toJS);
    return completer.future;
  }

  Future<(bool, String?)> authenticate({
    required BiometricAuthenticateParams params,
  }) {
    final completer = Completer<(bool, String?)>();
    void callback(JSBoolean result, JSString? biometricToken) =>
        completer.complete((result.toDart, biometricToken?.toDart));

    _authenticate(params._toExt, callback.toJS);
    return completer.future;
  }

  Future<bool> updateBiometricToken({required String token}) {
    final completer = Completer<bool>();
    void callback(JSBoolean result) => completer.complete(result.toDart);

    _updateBiometricToken(token.toJS, callback.toJS);
    return completer.future;
  }

  void openSettings() => _openSettings();
}
