import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'ExceptionUtils.dart';

class ColorUtils {
  static final instance = ColorUtils();

  ColorUtils() {
    ExceptionUtils.instance.throwCanNotCreateObjectSingletonInstance();
  }

  /* Health Assure project colors */
  static Color tempColor = Color(UtilColors.hexToInt('003B86'));
  static Color toastBackgroundColor = Color(UtilColors.hexToInt('CC5F5F5F'));

  // Random Color Generator - Munish Code - Start
  final List<Color> circleColors = [
    Colors.red, Colors.green, Colors.cyan, Colors.blue, Colors.orange, Colors.black45, Colors.yellow, Colors.purpleAccent, Colors.grey,
  ];

  Color randomGeneratorByIndex(int index) {
    int indexOfColor = _getColorIndex(index);
    return circleColors[indexOfColor];
  }

  int _getColorIndex(int index) {
    int indexOfColor = 0;
    if (index > (circleColors.length - 1)) {
      indexOfColor = (index % (circleColors.length - 1));
    } else {
      indexOfColor = index;
    }

    return indexOfColor;
  }
}

class UtilColors {
  static int hexToInt(String hex) {
    if (hex == null) {
      return -1;
    }

    if (hex.length == 6) {
      hex = 'FF$hex';
    }

    int val = 0;
    int len = hex.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = hex.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException('Invalid hexadecimal value');
      }
    }
    return val;
  }

  static Color parseHexColor(String hexColorString) {
    hexColorString = hexColorString.toUpperCase().replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString;
    }
    int colorInt = int.parse(hexColorString, radix: 16);
    return Color(colorInt);
  }
}
