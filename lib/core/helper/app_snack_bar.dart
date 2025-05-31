import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/utils/constant.dart';

SnackbarController appSnackbar({
  required String title,
  required String message,
  required Color backgroundColor,
}) =>
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontFamily: fontREM,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          fontFamily: fontREM,
          color: Colors.white,
        ),
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: backgroundColor,
    );
