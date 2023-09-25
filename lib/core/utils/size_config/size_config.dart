import "package:flutter/cupertino.dart";

class SizeConfig {
  static BuildContext? appContext;
  static MediaQueryData? _mediaQueryData;
  static double? screenHeight;
  static double? screenWidth;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    appContext = context;
    screenHeight = _mediaQueryData!.size.height;
    screenWidth = _mediaQueryData!.size.width;
  }

  static double getHeight(double height) {
    return _mediaQueryData!.size.height * (height / 844);
  }

  static double getWidth(double width) {
    return _mediaQueryData!.size.width * (width / 390);
  }

  static double getTextSize(double textSize) {
    return _mediaQueryData!.size.width * (textSize / 414);
  }
}
