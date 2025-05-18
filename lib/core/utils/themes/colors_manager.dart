import 'package:flutter/material.dart';

class ColorsManager {
  static const Color greenWhite = Color(0xff5BE9A0);
  static const Color whiteLowOpacity = Color(0xffF4F4F4);
  static const Color errorColor = Color(0xffBC1620);
  static const Color successColor = Color(0xff16B57A);
  static const Color darkModeColor = Color(0xFF121212);

  //****Gradients****\\
  static const Gradient forgotpasswordgradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x7389EAFF),
      Color(0x2BEDC807),
      Color(0x3B850404),
    ],
  );

  static const Gradient lightHomeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xBD06CEFA),
      Color(0xBD06CEFA),
      Color(0x4FB39806),
      Color(0x4FB39806),
      Color(0x7D450303),
    ],
  );
  static const Gradient darkHomeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xBD256472),
      Color(0x4F82773C),
      Color(0x7D120101),
    ],
  );
}
