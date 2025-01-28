part of '../../flutter_telegram_miniapp.dart';

/// Mini Apps can [adjust the appearance](https://core.telegram.org/bots/webapps#color-schemes)
/// of the interface to match the Telegram user's app in real time. This object contains the
/// user's current theme settings:
///
/// [API Reference](https://core.telegram.org/bots/webapps#themeparams)
class ThemeParams {
  final String? bgColorRaw;
  Color? get bgColor => bgColorRaw != null ? fromHex(bgColorRaw!) : null;

  final String? textColorRaw;
  Color? get textColor => textColorRaw != null ? fromHex(textColorRaw!) : null;

  final String? hintColorRaw;
  Color? get hintColor => hintColorRaw != null ? fromHex(hintColorRaw!) : null;

  final String? linkColorRaw;
  Color? get linkColor => linkColorRaw != null ? fromHex(linkColorRaw!) : null;

  final String? buttonColorRaw;
  Color? get buttonColor =>
      buttonColorRaw != null ? fromHex(buttonColorRaw!) : null;

  final String? buttonTextColorRaw;
  Color? get buttonTextColor =>
      buttonTextColorRaw != null ? fromHex(buttonTextColorRaw!) : null;

  final String? secondaryBgColorRaw;
  Color? get secondaryBgColor =>
      secondaryBgColorRaw != null ? fromHex(secondaryBgColorRaw!) : null;

  final String? headerBgColorRaw;
  Color? get headerBgColor =>
      headerBgColorRaw != null ? fromHex(headerBgColorRaw!) : null;

  final String? bottomBarBgColorRaw;
  Color? get bottomBarBgColor =>
      bottomBarBgColorRaw != null ? fromHex(bottomBarBgColorRaw!) : null;

  final String? accentTextColorRaw;
  Color? get accentTextColor =>
      accentTextColorRaw != null ? fromHex(accentTextColorRaw!) : null;

  final String? sectionBgColorRaw;
  Color? get sectionBgColor =>
      sectionBgColorRaw != null ? fromHex(sectionBgColorRaw!) : null;

  final String? sectionHeaderTextColorRaw;
  Color? get sectionHeaderTextColor => sectionHeaderTextColorRaw != null
      ? fromHex(sectionHeaderTextColorRaw!)
      : null;

  final String? sectionSeparatorColorRaw;
  Color? get sectionSeparatorColor => sectionSeparatorColorRaw != null
      ? fromHex(sectionSeparatorColorRaw!)
      : null;

  final String? subtitleTextColorRaw;
  Color? get subtitleTextColor =>
      subtitleTextColorRaw != null ? fromHex(subtitleTextColorRaw!) : null;

  final String? destructiveTextColorRaw;
  Color? get destructiveTextColor => destructiveTextColorRaw != null
      ? fromHex(destructiveTextColorRaw!)
      : null;

  factory ThemeParams._fromExternal(ThemeParamsExternal ext) => ThemeParams._(
        bgColorRaw: ext.bgColor,
        textColorRaw: ext.textColor,
        hintColorRaw: ext.hintColor,
        linkColorRaw: ext.linkColor,
        buttonColorRaw: ext.buttonColor,
        buttonTextColorRaw: ext.buttonTextColor,
        secondaryBgColorRaw: ext.secondaryBgColor,
        headerBgColorRaw: ext.headerBgColor,
        bottomBarBgColorRaw: ext.bottomBarBgColor,
        accentTextColorRaw: ext.accentTextColor,
        sectionBgColorRaw: ext.sectionBgColor,
        sectionHeaderTextColorRaw: ext.sectionHeaderTextColor,
        sectionSeparatorColorRaw: ext.sectionSeparatorColor,
        subtitleTextColorRaw: ext.subtitleTextColor,
        destructiveTextColorRaw: ext.destructiveTextColor,
      );

  ThemeParams._({
    this.bgColorRaw,
    this.textColorRaw,
    this.hintColorRaw,
    this.linkColorRaw,
    this.buttonColorRaw,
    this.buttonTextColorRaw,
    this.secondaryBgColorRaw,
    this.headerBgColorRaw,
    this.bottomBarBgColorRaw,
    this.accentTextColorRaw,
    this.sectionBgColorRaw,
    this.sectionHeaderTextColorRaw,
    this.sectionSeparatorColorRaw,
    this.subtitleTextColorRaw,
    this.destructiveTextColorRaw,
  });

  @override
  String toString() {
    return "bgColor: $bgColor \n"
        "textColor: $textColor \n"
        "hintColor: $hintColor \n"
        "buttonColor: $buttonColor \n"
        "buttonTextColor: $buttonTextColor \n"
        "secondaryBgColor: $secondaryBgColor \n"
        "headerBgColor: $headerBgColor \n"
        "bottomBarBgColor: $bottomBarBgColor \n"
        "accentTextColor: $accentTextColor \n"
        "sectionBgColor: $sectionBgColor \n"
        "sectionHeaderTextColor: $sectionHeaderTextColor \n"
        "sectionSeparatorColor: $sectionSeparatorColor \n"
        "subtitleTextColor: $subtitleTextColor \n"
        "destructiveTextColor: $destructiveTextColor \n";
  }
}

extension type ThemeParamsExternal(JSObject _) implements JSObject {
  @JS("bg_color")
  external String? bgColor;
  @JS("text_color")
  external String? textColor;
  @JS("hint_color")
  external String? hintColor;
  @JS("link_color")
  external String? linkColor;
  @JS("button_color")
  external String? buttonColor;
  @JS("button_text_color")
  external String? buttonTextColor;
  @JS("secondary_bg_color")
  external String? secondaryBgColor;
  @JS("header_bg_color")
  external String? headerBgColor;
  @JS("bottom_bar_bg_color")
  external String? bottomBarBgColor;
  @JS("accent_text_color")
  external String? accentTextColor;
  @JS("section_bg_color")
  external String? sectionBgColor;
  @JS("section_header_text_color")
  external String? sectionHeaderTextColor;
  @JS("section_separator_color")
  external String? sectionSeparatorColor;
  @JS("subtitle_text_color")
  external String? subtitleTextColor;
  @JS("destructive_text_color")
  external String? destructiveTextColor;
}
