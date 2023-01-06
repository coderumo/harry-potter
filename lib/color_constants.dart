import 'dart:ui';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color blue1 = hexToColor('#06283D');
  static Color blue2 = hexToColor('#1363DF');
  static Color blue3 = hexToColor('#47B5FF');
  static Color blue4 = hexToColor('#DFF6FF');
  static Color black = hexToColor('#FFFFFF');
  static Color white = hexToColor('#000000');
}
