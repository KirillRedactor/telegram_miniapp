import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

const _backButtonPath = "$webAppPath.BackButton";

@JS("$_backButtonPath.isVisible")
external bool get _isVisible;

@JS("$_backButtonPath.show")
external void _show();

@JS("$_backButtonPath.hide")
external void _hide();

/// This object controls the back button, which can be displayed in the header
/// of the Mini App in the Telegram interface.
///
/// [API Reference](https://core.telegram.org/bots/webapps#backbutton)
class BackButton {
  /// Shows whether the button is visible. Set to *false* by default.
  bool get isVisible => _isVisible;

  /// `Bot API 6.1+` A method to make the button active and visible.
  void show() => _show();

  /// `Bot API 6.1+` A method to hide the button.
  void hide() => _hide();

  BackButton();
}
