import 'dart:math';

import 'package:flutter/material.dart';

abstract class Palette {
  static const Color scaffoldBackgroundColor = Color(0xff1E1E1E);
  static const Color splashBackground = Color(0xff121212);
  static const Color secondaryBackground = Color(0xff2B2B2B);

  static const Color lightGrey = Color(0xff2F2F2F);
  static const Color opaqueGrey = Color(0xff464545);
  static const Color primary = Color(0xffF7B52C);

  static const Color errColor = Color(0xFFF44336);

  static const Color foreground = Color(0xffFFFFFF);

  static const Color inputBorder = Color(0xff383838);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment(-1.15, 1.0), // Adjusted for -15.77%
    end: Alignment(2.39, -0.4), // Adjusted for 119.39%
    colors: [
      Color(0xFFF3802B),
      Color(0xFFFAE42C),
    ],
  );
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) {
  return max(0, min((value + ((255 - value) * factor)).round(), 255));
}

Color tintColor(Color color, double factor) {
  return Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1,
  );
}

int shadeValue(int value, double factor) {
  return max(0, min(value - (value * factor).round(), 255));
}

Color shadeColor(Color color, double factor) {
  return Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1,
  );
}
