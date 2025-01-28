import 'dart:ui';

/// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

/// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
String toHex(Color color, {bool leadingHashSign = true}) =>
    '${leadingHashSign ? '#' : ''}'
    '${(color.r * 255).toInt().toRadixString(16).padLeft(2, '0')}'
    '${(color.g * 255).toInt().toRadixString(16).padLeft(2, '0')}'
    '${(color.b * 255).toInt().toRadixString(16).padLeft(2, '0')}';
