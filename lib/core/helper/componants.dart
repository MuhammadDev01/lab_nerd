import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

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
        style: TextStyles.rem20Boldd.copyWith(color: Colors.white),
      ),
      messageText: Text(
        message,
        style: TextStyles.rem16Bold.copyWith(color: Colors.white),
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: backgroundColor,
    );
