part of '../../telegram_miniapp.dart';

/// This object describes additional sharing settings for the native story editor.
///
/// [API Reference](https://core.telegram.org/bots/webapps#storyshareparams)
class StoryShareParams {
  /// *Optional.* The caption to be added to the media, 0-200 characters for regular
  /// users and 0-2048 characters for [premium](https://telegram.org/faq_premium#telegram-premium) subscribers.
  String? text;

  /// *Optional.* An object that describes a widget link to be included in the story.
  /// Note that only [premium](https://telegram.org/faq_premium#telegram-premium) subscribers can post stories with links.
  StoryWidgetLink? widgetLink;

  StoryShareParams({
    this.text,
    this.widgetLink,
  });

  // factory StoryWidgetLink._fromExternal(StoryWidgetLinkExternal ext) =>
  //     StoryWidgetLink(
  //       url: ext.url,
  //       name: ext.name,
  //     );

  StoryShareParamsExternal get _toExt =>
      createJSInteropWrapper<_StoryShareParamsExport>(_StoryShareParamsExport(
        text: text,
        widgetLink: widgetLink?._toExt,
      )) as StoryShareParamsExternal;
}

@JSExport()
class _StoryShareParamsExport {
  String? text;
  // ignore: non_constant_identifier_names
  StoryWidgetLinkExternal? widget_link;

  _StoryShareParamsExport({this.text, StoryWidgetLinkExternal? widgetLink})
      : widget_link = widgetLink;
}

extension type StoryShareParamsExternal(JSObject _) implements JSObject {
  external String? text;
  @JS("widget_link")
  external StoryWidgetLinkExternal? widgetLink;
}
