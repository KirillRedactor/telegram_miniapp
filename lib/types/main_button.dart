import 'dart:js_interop';
import 'dart:ui';

import 'package:telegram_miniapp/telegram_miniapp.dart';
import 'package:telegram_miniapp/types/bottom_button.dart';

const _mainButtonPath = "$webAppPath.MainButton";

@JS("$_mainButtonPath.type")
external String get _type;

@JS("$_mainButtonPath.text")
external String get _text;

@JS("$_mainButtonPath.color")
external String get _color;

@JS("$_mainButtonPath.textColor")
external String get _textColor;

@JS("$_mainButtonPath.isVisible")
external bool get _isVisible;

@JS("$_mainButtonPath.isActive")
external bool get _isActive;

@JS("$_mainButtonPath.hasShineEffect")
external bool get _hasShineEffect;

@JS("$_mainButtonPath.isProgressVisible")
external bool get _isProgressVisible;

@JS("$_mainButtonPath.setText")
external void _setText(JSString text);

@JS("$_mainButtonPath.show")
external void _show();

@JS("$_mainButtonPath.hide")
external void _hide();

@JS("$_mainButtonPath.enable")
external void _enable();

@JS("$_mainButtonPath.disable")
external void _disable();

@JS("$_mainButtonPath.showProgress")
external void _showProgress(JSBoolean leaveActive);

@JS("$_mainButtonPath.hideProgress")
external void _hideProgress();

@JS("$_mainButtonPath.setParams")
external void _setParams(
  JSString? text,
  JSString? color,
  JSString? textColor,
  JSBoolean? hasShineEffect,
  JSString? position,
  // ignore: non_constant_identifier_names
  JSBoolean? is_active,
  // ignore: non_constant_identifier_names
  JSBoolean? is_visible,
);

class MainButton implements BottomButton {
  @override
  String get type => _type;

  @override
  String get text => _text;

  @override
  String get colorRaw => _color;
  @override
  Color get color => fromHex(_color);

  @override
  String get textColorRaw => _textColor;
  @override
  Color get textColor => fromHex(_textColor);

  @override
  bool get isVisible => _isVisible;

  @override
  bool get isActive => _isActive;

  @override
  bool get hasShineEffect => _hasShineEffect;

  @override
  bool get isProgressVisible => _isProgressVisible;

  @override
  void setText(String text) => _setText(text.toJS);

  @override
  void show() => _show();
  @override
  void hide() => _hide();

  @override
  void enable() => _enable();
  @override
  void disable() => _disable();

  @override
  void showProgress({bool leaveActive = false}) =>
      _showProgress(leaveActive.toJS);
  @override
  void hideProgress() => _hideProgress();

  void setParams({
    String? text,
    Color? color,
    String? colorRaw,
    Color? textColor,
    String? textColorRaw,
    bool? hasShineEffect,
    bool? isActive,
    bool? isVisible,
  }) =>
      _setParams(
        text?.toJS,
        color != null ? toHex(color).toJS : colorRaw?.toJS,
        textColor != null ? toHex(textColor).toJS : textColorRaw?.toJS,
        hasShineEffect?.toJS,
        null,
        isActive?.toJS,
        isVisible?.toJS,
      );
}
