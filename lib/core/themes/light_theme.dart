import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final lightTheme = ThemeData(
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
    bodyMedium: TextStyle(color: Colors.black),
  ),
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
);
