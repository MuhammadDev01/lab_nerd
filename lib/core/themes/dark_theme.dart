import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';

final darkTheme = ThemeData(
//  primaryColorDark: ColorsManager.greenWhite,
//  primaryColorLight: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    backgroundColor: ColorsManager.darkModeColor,
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
  scaffoldBackgroundColor: ColorsManager.darkModeColor,
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
  brightness: Brightness.dark,
);
