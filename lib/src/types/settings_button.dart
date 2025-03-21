import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

const _settingsButtonPath = "$webAppPath.SettingsButton";

@JS("$_settingsButtonPath.isVisible")
external bool get _isVisible;

@JS("$_settingsButtonPath.show")
external void _show();

@JS("$_settingsButtonPath.hide")
external void _hide();

/// This object controls the Settings item in the context menu of the Mini App
/// in the Telegram interface.
///
/// [API Reference](https://core.telegram.org/bots/webapps#settingsbutton)
class SettingsButton {
  /// Shows whether the context menu item is visible. Set to false by default.
  bool get isVisible => _isVisible;

  /// `Bot API 7.0+` A method to make the Settings item in the context menu visible.
  void show() => _show();

  /// `Bot API 7.0+` A method to hide the Settings item in the context menu.
  void hide() => _hide();

  SettingsButton();
}
