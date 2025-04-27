import 'package:flutter/material.dart';

class ColorsManager {
  static Color greenWhite = const Color(0xff5BE9A0);
  static Color whiteLowOpacity = const Color(0xffF4F4F4);
  static Color errorColor = const Color(0xffBC1620);
  static Color successColor = const Color(0xff16B57A);
  static Color darkModeColor = const Color(0xFF121212);
  static Gradient forgotpasswordgradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xffFFB636),
      const Color(0x66FFB636),
      const Color(0xE3FFB636),
    ],
  );
}
