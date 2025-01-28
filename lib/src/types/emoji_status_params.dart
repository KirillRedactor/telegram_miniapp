part of '../../flutter_telegram_miniapp.dart';

/// This object describes additional settings for setting an emoji status.
///
/// [API Reference](https://core.telegram.org/bots/webapps#emojistatusparams)
@JSExport()
class EmojiStatusParams {
  /// *Optional.* The duration for which the status will remain set, in seconds.
  int duration;

  EmojiStatusParams(this.duration);

  EmojiStatusParamsExternal get _toExt =>
      createJSInteropWrapper<EmojiStatusParams>(this)
          as EmojiStatusParamsExternal;
}

extension type EmojiStatusParamsExternal(JSObject _) implements JSObject {
  external int duration;
}
