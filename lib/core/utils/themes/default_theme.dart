import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final defaultTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 32,
    ),
  ),
  textTheme: TextTheme(
    displaySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'REM',
      fontSize: 20.sp,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
);
