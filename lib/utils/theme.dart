import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeApp {
  static final defaultTheme = ThemeData(
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
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
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'REM',
        fontSize: 20,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    appBarTheme: const AppBarTheme(
      titleSpacing: 20,
      backgroundColor: Color(0xff27292a),
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 32,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xff27292a),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'REM',
        fontSize: 20,
      ),
    ),
    brightness: Brightness.dark,
  );
}
