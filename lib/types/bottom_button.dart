import 'dart:ui';

abstract interface class BottomButton {
  String get type;

  String get text;

  String get colorRaw;
  Color get color;

  String get textColorRaw;
  Color get textColor;

  bool get isVisible;

  bool get isActive;

  bool get hasShineEffect;

  // Only for second button
  // String get position;

  bool get isProgressVisible;

  void setText(String text);

  void show();
  void hide();

  void enable();
  void disable();

  void showProgress({bool leaveActive});
  void hideProgress();

  // void setParams({
  //   String? text,
  //   Color? color,
  //   String? colorRaw,
  //   Color? textColor,
  //   String? textColorRaw,
  //   bool? hasShineEffect,
  //   BottomButtonPosition? position,
  //   bool? isActive,
  //   bool? isVisible,
  // });
}
