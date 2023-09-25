

//  App-Styling for texts
import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/constants/fonts.dart';

class AppStyle {
  static const TextStyle title = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 36,
      letterSpacing: -0.02,
      fontFamily: AppFonts.openSans);

  static const TextStyle header2 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      letterSpacing: -0.02,
      fontFamily: AppFonts.openSans);

  static const TextStyle header3 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24,
    letterSpacing: -0.02,
     fontFamily: AppFonts.openSans
  );
  static const TextStyle header = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    letterSpacing: -0.02,
     fontFamily: AppFonts.openSans
  );

  static const TextStyle subtitle = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 14, fontFamily: AppFonts.openSans);

  static const TextStyle body = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      // letterSpacing: 1.4,
      fontFamily: AppFonts.openSans);

  static const TextStyle small = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 12, fontFamily: AppFonts.openSans);

  static const TextStyle preTitle = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 14, fontFamily: AppFonts.openSans);

  static const TextStyle buttonText = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, fontFamily: AppFonts.openSans);

  static const TextStyle link = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, fontFamily: AppFonts.openSans);
}
