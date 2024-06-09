import 'package:flutter/material.dart';

Color animationColor(double value, Color begin, Color end) {
  int red = (begin.red * value + end.red * (1 - value)).toInt();
  int green = (begin.green * value + end.green * (1 - value)).toInt();
  int blue = (begin.blue * value + end.blue * (1 - value)).toInt();
  double opacity = begin.opacity * value + end.opacity * (1 - value);

  return Color.fromRGBO(red, green, blue, opacity);
}
