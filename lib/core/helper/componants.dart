import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

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
        style: TextStyles.rem20Bold.copyWith(color: Colors.white),
      ),
      messageText: Text(
        message,
        style: TextStyles.rem16SemiBold.copyWith(color: Colors.white),
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: backgroundColor,
    );

Divider appDivider({Color? color, double? height, double? thickness}) =>
    Divider(
      color: color ?? ColorsManager.greenWhite,
      height: height ?? 50.h,
      thickness: thickness ?? 1.5.h,
    );
