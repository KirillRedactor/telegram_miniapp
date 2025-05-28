// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../flutter_telegram_miniapp.dart';

/// This object represents the system-defined safe area insets, providing padding
/// values to ensure content remains within visible boundaries, avoiding overlap
/// with system UI elements like notches or navigation bars.
///
/// [API Reference](https://core.telegram.org/bots/webapps#safeareainset)
class SafeAreaInsert {
  /// The top inset in pixels, representing the space to avoid at the top of the screen.
  final int top;

  /// The bottom inset in pixels, representing the space to avoid at the bottom of the screen.
  final int bottom;

  /// The left inset in pixels, representing the space to avoid on the left side of the screen.
  final int left;

  /// The right inset in pixels, representing the space to avoid on the right side of the screen.
  final int right;

  SafeAreaInsert({
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
  });

  factory SafeAreaInsert._fromExternal(SafeAreaInsertExternal ext) =>
      SafeAreaInsert(
        top: ext.top.toDartInt,
        bottom: ext.bottom.toDartInt,
        left: ext.left.toDartInt,
        right: ext.right.toDartInt,
      );
}

extension type SafeAreaInsertExternal(JSObject _) implements JSObject {
  external JSNumber top;
  external JSNumber bottom;
  external JSNumber left;
  external JSNumber right;
}
