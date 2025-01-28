part of '../../telegram_miniapp.dart';

/// This object describes the native popup button.
///
/// [API Reference](https://core.telegram.org/bots/webapps#popupbutton)
class PopupButton {
  /// *Optional.* Identifier of the button, 0-64 characters. Set to empty string by default.
  /// If the button is pressed, its *id* is returned in the callback and the *popupClosed* event.
  String? id;

  /// *Optional.* Type of the button. Set to *default* by default.
  /// Can be one of these values:
  /// - *default*, a button with the default style,
  /// - *ok*, a button with the localized text “OK”,
  /// - *close*, a button with the localized text “Close”,
  /// - *cancel*, a button with the localized text “Cancel”,
  /// - *destructive*, a button with a style that indicates a destructive action (e.g. “Remove”, “Delete”, etc.).
  PopupButtonType? type;

  /// *Optional.* The text to be displayed on the button, 0-64 characters.
  /// Required if *type* is *default* or *destructive*. Irrelevant for other types.
  String? text;

  PopupButton({
    this.id,
    this.type,
    this.text,
  }) : assert(
            (type == PopupButtonType.defaultType ||
                    type == PopupButtonType.destructive) &&
                text != null,
            "Field text required if type is default or destructive.");

  PopupButtonExternal get _toExt => createJSInteropWrapper(_PopupButtonExport(
        id: id,
        type: type?.name.replaceAll("Type", ""),
        text: text,
      )) as PopupButtonExternal;
}

@JSExport()
class _PopupButtonExport {
  String? id;
  String? type;
  String? text;

  _PopupButtonExport({
    required this.id,
    this.type,
    this.text,
  });
}

extension type PopupButtonExternal(JSObject _) implements JSObject {
  external String id;
  external String type;
  external String? text;
}
