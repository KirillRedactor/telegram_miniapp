part of '../../flutter_telegram_miniapp.dart';

/// This object describes the native popup.
///
/// [API Reference]
class PopupParams {
  /// *Optional.* The text to be displayed in the popup title, 0-64 characters.
  String? title;

  /// The message to be displayed in the body of the popup, 1-256 characters.
  String message;

  /// *Optional.* List of buttons to be displayed in the popup, 1-3 buttons.
  /// Set to *[{“type”:“close”}]* by default.
  List<PopupButton>? buttons;

  PopupParams({
    this.title,
    required this.message,
    this.buttons,
  });

  // factory PopupParams._fromExternal(PopupParamsExternal ext) =>
  //     PopupParams(
  //       url: ext.url,
  //       name: ext.name,
  //     );

  PopupParamsExternal get _toExt => createJSInteropWrapper(_PopupParamsExport(
        title: title,
        message: message,
        buttons: buttons?.map((e) => e._toExt).toList(),
      )) as PopupParamsExternal;
}

@JSExport()
class _PopupParamsExport {
  String? title;
  String message;
  List<PopupButtonExternal>? buttons;

  _PopupParamsExport({
    this.title,
    required this.message,
    this.buttons,
  });
}

extension type PopupParamsExternal(JSObject _) implements JSObject {
  external String id;
  external String type;
  external String? text;
}
