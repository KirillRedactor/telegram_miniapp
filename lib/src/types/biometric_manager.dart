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
external void _requestAccess(BiometricRequestAccessParamsExternal params,
    [JSFunction? callback]);

@JS("$_biometricManagerPath.authenticate")
external void _authenticate(BiometricAuthenticateParamsExternal params,
    [JSFunction? callback]);

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

  void init({void Function()? callback}) => _init(callback?.toJS);

  Future<bool> initAsync() async {
    Completer<bool> completer = Completer();
    void callback() => completer.complete(true);

    _init(callback.toJS);
    return await completer.future;
  }

  void requestAccess(
          {required BiometricRequestAccessParams params,
          void Function(bool result)? callback}) =>
      _requestAccess(params._toExt, callback?.toJS);

  Future<bool> requestAccessAsync(
      {required BiometricRequestAccessParams params}) async {
    Completer<bool> completer = Completer();
    void callback(JSBoolean result) => completer.complete(result.toDart);

    _requestAccess(params._toExt, callback.toJS);
    return await completer.future;
  }

  void authenticate({
    required BiometricAuthenticateParams params,
    void Function(bool result, String? biometricToken)? callback,
  }) =>
      _authenticate(params._toExt, callback?.toJS);

  Future<(bool, String?)> authenticateAsync(
      {required BiometricAuthenticateParams params}) async {
    Completer<(bool, String?)> completer = Completer();
    void callback(JSBoolean result, JSString? biometricToken) =>
        completer.complete((result.toDart, biometricToken?.toDart));

    _authenticate(params._toExt, callback.toJS);
    return await completer.future;
  }

  void updateBiometricToken(
          {required String token, void Function(bool result)? callback}) =>
      _updateBiometricToken(token.toJS, callback?.toJS);

  Future<bool> updateBiometricTokenAsync({required String token}) async {
    Completer<bool> completer = Completer();
    void callback(JSBoolean result) => completer.complete(result.toDart);

    _updateBiometricToken(token.toJS, callback.toJS);
    return await completer.future;
  }

  void openSettings() => _openSettings();
}
