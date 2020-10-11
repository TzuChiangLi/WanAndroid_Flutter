import 'package:flutter/material.dart';

class ColorUtil {
  static ColorUtil _instance;

  static ColorUtil getInstance() {
    if (_instance == null) {
      _instance = new ColorUtil();
    }
    return _instance;
  }

  //颜色强转
  static Color convertColor(String color) {
    color = color.replaceAll("#", "");
    return Color(int.parse("0xFF" + color));
  }
}
