import 'dart:js_interop';
import 'dart:ui';

import '../enums/bottom_button_position.dart';
import '../../flutter_telegram_miniapp.dart';
import 'bottom_button.dart';

const _secondaryButtonPath = "$webAppPath.SecondaryButton";

@JS("$_secondaryButtonPath.type")
external String get _type;

@JS("$_secondaryButtonPath.text")
external String get _text;

@JS("$_secondaryButtonPath.color")
external String get _color;

@JS("$_secondaryButtonPath.textColor")
external String get _textColor;

@JS("$_secondaryButtonPath.isVisible")
external bool get _isVisible;

@JS("$_secondaryButtonPath.isActive")
external bool get _isActive;

@JS("$_secondaryButtonPath.hasShineEffect")
external bool get _hasShineEffect;

@JS("$_secondaryButtonPath.position")
external String get _position;

@JS("$_secondaryButtonPath.isProgressVisible")
external bool get _isProgressVisible;

@JS("$_secondaryButtonPath.setText")
external void _setText(JSString text);

@JS("$_secondaryButtonPath.show")
external void _show();

@JS("$_secondaryButtonPath.hide")
external void _hide();

@JS("$_secondaryButtonPath.enable")
external void _enable();

@JS("$_secondaryButtonPath.disable")
external void _disable();

@JS("$_secondaryButtonPath.showProgress")
external void _showProgress(JSBoolean leaveActive);

@JS("$_secondaryButtonPath.hideProgress")
external void _hideProgress();

@JS("$_secondaryButtonPath.setParams")
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

class SecondaryButton implements BottomButton {
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

  BottomButtonPosition get position => BottomButtonPosition.fromName(_position);

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
    BottomButtonPosition? position,
    bool? isActive,
    bool? isVisible,
  }) =>
      _setParams(
        text?.toJS,
        color != null ? toHex(color).toJS : colorRaw?.toJS,
        textColor != null ? toHex(textColor).toJS : textColorRaw?.toJS,
        hasShineEffect?.toJS,
        position?.name.toJS,
        isActive?.toJS,
        isVisible?.toJS,
      );
}
