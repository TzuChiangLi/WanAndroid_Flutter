import 'package:flutter/material.dart';
import 'dart:io';

class ColorUtil {
  static ColorUtil _INSTANCE;

  static ColorUtil getInstance() {
    if (_INSTANCE == null) {
      _INSTANCE = new ColorUtil();
    }
    return _INSTANCE;
  }

  //颜色强转
  static Color convertColor(String color) {
    color = color.replaceAll("#", "");
    return Color(int.parse("0xFF" + color));
  }
}
