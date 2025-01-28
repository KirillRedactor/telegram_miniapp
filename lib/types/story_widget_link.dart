part of '../telegram_miniapp.dart';

/// This object describes a widget link to be included in the story.
///
/// [API Reference](https://core.telegram.org/bots/webapps#storywidgetlink)
@JSExport()
class StoryWidgetLink {
  /// The URL to be included in the story.
  String url;

  /// *Optional.* The name to be displayed for the widget link, 0-48 characters.
  String? name;

  StoryWidgetLink({
    required this.url,
    this.name,
  });

  // factory StoryWidgetLink._fromExternal(StoryWidgetLinkExternal ext) =>
  //     StoryWidgetLink(
  //       url: ext.url,
  //       name: ext.name,
  //     );

  StoryWidgetLinkExternal get _toExt =>
      createJSInteropWrapper<StoryWidgetLink>(this) as StoryWidgetLinkExternal;
}

extension type StoryWidgetLinkExternal(JSObject _) implements JSObject {
  external String url;
  external String? name;
}
