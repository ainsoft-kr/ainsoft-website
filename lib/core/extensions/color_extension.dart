import 'dart:ui';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) {
    return '${leadingHashSign ? '#' : ''}'
        '${((a * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0')}'
        '${((r * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0')}'
        '${((g * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0')}'
        '${((b * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0')}';
  }
}
