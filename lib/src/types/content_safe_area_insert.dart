// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../flutter_telegram_miniapp.dart';

/// This object represents the content-defined safe area insets, providing padding
/// values to ensure content remains within visible boundaries, avoiding overlap
/// with Telegram UI elements.
///
/// [API Reference](https://core.telegram.org/bots/webapps#contentsafeareainset)
class ContentSafeAreaInset {
  /// The top inset in pixels, representing the space to avoid at the top of
  /// the content area.
  final double top;

  /// The bottom inset in pixels, representing the space to avoid at the bottom
  /// of the content area.
  final double bottom;

  /// The left inset in pixels, representing the space to avoid on the left side
  /// of the content area.
  final double left;

  /// The right inset in pixels, representing the space to avoid on the right
  /// side of the content area.
  final double right;

  ContentSafeAreaInset({
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
  });

  factory ContentSafeAreaInset._fromExternal(
    ContentSafeAreaInsetExternal ext,
  ) => ContentSafeAreaInset(
    top: ext.top.toDartDouble,
    bottom: ext.bottom.toDartDouble,
    left: ext.left.toDartDouble,
    right: ext.right.toDartDouble,
  );
}

extension type ContentSafeAreaInsetExternal(JSObject _) implements JSObject {
  external JSNumber top;
  external JSNumber bottom;
  external JSNumber left;
  external JSNumber right;
}
