part of '../telegram_miniapp.dart';

/// This object describes the native popup for scanning QR codes.
///
/// [API Reference](https://core.telegram.org/bots/webapps#scanqrpopupparams)
@JSExport()
class ScanQrPopupParams {
  /// The text to be displayed under the 'Scan QR' heading, 0-64 characters.
  String text;

  ScanQrPopupParams(this.text);

  ScanQrPopupParamsExternal get _toExt =>
      createJSInteropWrapper<ScanQrPopupParams>(this)
          as ScanQrPopupParamsExternal;
}

extension type ScanQrPopupParamsExternal(JSObject _) implements JSObject {
  external String text;
}
