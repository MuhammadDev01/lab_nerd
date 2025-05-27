import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/widgets/constant.dart';

class TextStyles {
  //*** Inter ***\\
  static TextStyle poppins32Regular = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 32),
    fontFamily: fontPoppins,
    fontWeight: FontWeight.normal,
  );
  static TextStyle poppins32RegularRED = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 32),
    fontFamily: fontPoppins,
    fontWeight: FontWeight.normal,
    color: Color(0xffC12D2B),
  );
  static TextStyle poppins32Bold = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 32),
    fontFamily: fontPoppins,
    fontWeight: FontWeight.bold,
  );
  //*** REM ***\\
  static TextStyle rem14SemiBold = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 14),
    fontWeight: FontWeight.w600,
    fontFamily: fontREM,
  );
  static TextStyle rem16SemiBold = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.w600,
    fontFamily: fontREM,
  );
  static TextStyle rem20Bold = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.bold,
    fontFamily: fontREM,
  );
  static TextStyle rem26Bold = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 26),
    fontFamily: fontREM,
    fontWeight: FontWeight.bold,
  );
//*** Slackside One ***\\
  static TextStyle slacksideOnes16 = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontFamily: fontSlacksideOne,
    color: Color.fromARGB(255, 109, 74, 74),
  );
  static TextStyle slacksideOnes20Bold = TextStyle(
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.bold,
    fontFamily: fontSlacksideOne,
  );
  static TextStyle slacksideOnes30Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontSlacksideOne,
    fontSize: getResponsiveFontSize(fontSize: 30),
  );
}

class ConfigSize {
  static const double tabletSize = 600;
  static const double desktopSize = 1200.0;
}

double getResponsiveFontSize({required double fontSize}) {
  final double scaleFactor = _getScaleFactor();
  final double responsiveFontSize = fontSize * scaleFactor;

  // 🔒 الحد الأدنى والأقصى لحجم الخط
  final double lowerLimit = fontSize * 0.8;
  final double upperLimit = fontSize * 1.3;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double _getScaleFactor() {
  final double width = MediaQuery.of(Get.context!).size.width;

  return width / 550;
}
