import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

const _settingsButtonPath = "$webAppPath.SettingsButton";

@JS("$_settingsButtonPath.isVisible")
external bool get _isVisible;

@JS("$_settingsButtonPath.show")
external void _show();

@JS("$_settingsButtonPath.hide")
external void _hide();

class SettingsButton {
  bool get isVisible => _isVisible;

  void show() => _show();

  void hide() => _hide();

  SettingsButton();
}
