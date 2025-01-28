import 'dart:js_interop';

import '../../telegram_miniapp.dart';

const _backButtonPath = "$webAppPath.BackButton";

@JS("$_backButtonPath.isVisible")
external bool get _isVisible;

@JS("$_backButtonPath.show")
external void _show();

@JS("$_backButtonPath.hide")
external void _hide();

class BackButton {
  bool get isVisible => _isVisible;

  void show() => _show();

  void hide() => _hide();

  BackButton();
}
