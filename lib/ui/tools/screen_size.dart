import 'package:flutter/widgets.dart';

class ScreenSize {
  static late MediaQueryData data;
  static late double safeAreaHorizontal;
  static late double safeAreaVertical;
  static late double width;
  static late double height;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static void init(BuildContext context) {
    data = MediaQuery.of(context);
    width = data.size.width;
    height = data.size.height;
    blockSizeHorizontal = width / 100;
    blockSizeVertical = height / 100;
    safeAreaHorizontal = data.padding.left + data.padding.right;
    safeAreaVertical = data.padding.top + data.padding.bottom;
    safeBlockHorizontal = (width - safeAreaHorizontal) / 100;
    safeBlockVertical = (height - safeAreaVertical) / 100;
  }
}
