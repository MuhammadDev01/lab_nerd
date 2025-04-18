import 'package:flutter/material.dart';
import 'package:lab_nerd/constant.dart';

class TextStyles {
  //*** Inter ***\\
  static TextStyle inter32Regular = const TextStyle(
    fontSize: 32,
    fontFamily: fontInter,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle inter32Bold = const TextStyle(
    fontSize: 32,
    fontFamily: fontInter,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  //*** REM ***\\
  static TextStyle rem14Bold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: fontREM,
    color: Colors.black,
  );
  static TextStyle rem16Bold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: fontREM,
    color: Colors.black,
  );
  static TextStyle rem26Bold = const TextStyle(
    fontSize: 26,
    fontFamily: 'REM',
    fontWeight: FontWeight.bold,
  );
//*** Slackside One ***\\
  static TextStyle slacksideOnesF16 = const TextStyle(
    fontSize: 16,
    fontFamily: fontSlacksideOne,
    color: Color.fromARGB(255, 109, 74, 74),
  );
}
