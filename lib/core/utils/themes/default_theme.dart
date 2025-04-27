import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final defaultTheme = ThemeData(
  //primaryColorDark: Colors.black,
  //primaryColorLight: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 32,
    ),
  ),

  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
);
