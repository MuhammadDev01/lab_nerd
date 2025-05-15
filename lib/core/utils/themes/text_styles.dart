import 'package:flutter/material.dart';
import 'package:lab_nerd/widgets/constant.dart';

class TextStyles {
  //*** Inter ***\\
  static TextStyle poppins32Regular = const TextStyle(
    fontSize: 32,
    fontFamily: fontPoppins,
    fontWeight: FontWeight.normal,
  );
  static TextStyle poppins32RegularRED = const TextStyle(
    fontSize: 32,
    fontFamily: fontPoppins,
    fontWeight: FontWeight.normal,
    color: Color(0xffC12D2B),
  );
  static TextStyle poppins32Bold = const TextStyle(
    fontSize: 32,
    fontFamily: fontPoppins,
    fontWeight: FontWeight.bold,
  );
  //*** REM ***\\
  static TextStyle rem14Bold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: fontREM,
  );
  static TextStyle rem16Bold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: fontREM,
  );
  static TextStyle rem20Boldd = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: fontREM,
  );
  static TextStyle rem26Bold = const TextStyle(
    fontSize: 26,
    fontFamily: fontREM,
    fontWeight: FontWeight.bold,
  );
//*** Slackside One ***\\
  static TextStyle slacksideOnes16 = const TextStyle(
    fontSize: 16,
    fontFamily: fontSlacksideOne,
    color: Color.fromARGB(255, 109, 74, 74),
  );
  static TextStyle slacksideOnes20Bold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontSlacksideOne,
    fontSize: 20,
  );
  static TextStyle slacksideOnes30Bold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontSlacksideOne,
    fontSize: 40,
  );
}
