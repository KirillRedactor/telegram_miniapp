import 'dart:ui';

abstract interface class BottomButton {
  /// *Readonly.* Type of the button. It can be either *main* for the main button
  /// or secondary for the *secondary* button.
  String get type;

  /// Current button text. Set to *Continue* for the main button and *Cancel* for
  /// the secondary button by default.
  String get text;

  /// Current button color. Set to *themeParams.button_color* for the main button
  /// and *themeParams.bottom_bar_bg_color* for the secondary button by default.
  String get colorRaw;

  /// Current button color. Set to *themeParams.button_color* for the main button
  /// and *themeParams.bottom_bar_bg_color* for the secondary button by default.
  Color get color;

  /// Current button text color. Set to *themeParams.button_text_color* for the
  /// main button and *themeParams.button_color* for the secondary button by default.
  String get textColorRaw;

  /// Current button text color. Set to *themeParams.button_text_color* for the
  /// main button and *themeParams.button_color* for the secondary button by default.
  Color get textColor;

  /// Shows whether the button is visible. Set to *false* by default.
  bool get isVisible;

  /// Shows whether the button is active. Set to *true* by default.
  bool get isActive;

  /// `Bot API 7.10+` Shows whether the button has a shine effect.
  /// Set to *false* by default.
  bool get hasShineEffect;

  // Only for second button
  // String get position;

  /// *Readonly.* Shows whether the button is displaying a loading indicator.
  bool get isProgressVisible;

  /// A method to set the button text.
  void setText(String text);

  /// A method to make the button visible.
  ///
  /// *Note that opening the Mini App from the attachment menu hides the main
  /// button until the user interacts with the Mini App interface.*
  void show();

  /// A method to hide the button.
  void hide();

  /// A method to enable the button.
  void enable();

  /// A method to disable the button.
  void disable();

  /// A method to show a loading indicator on the button.
  /// It is recommended to display loading progress if the action tied to the
  /// button may take a long time. By default, the button is disabled while the
  /// action is in progress. If the parameter `leaveActive=true` is passed, the
  /// button remains enabled.
  void showProgress({bool leaveActive});

  /// A method to hide the loading indicator.
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
