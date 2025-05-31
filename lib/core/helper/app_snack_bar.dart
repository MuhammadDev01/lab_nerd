import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/utils/constant.dart';

appSnackbar({
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
          fontSize: 20.sp,
          fontFamily: fontREM,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 16.sp,
          fontFamily: fontREM,
          color: Colors.white,
        ),
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: backgroundColor,
    );
