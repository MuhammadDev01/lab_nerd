import 'package:flutter/material.dart';
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

Divider appDivider() => const Divider(
      color: ColorsManager.greenWhite,
      height: 50,
    );

AppBar customAppBar({
  required String centerTitle,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      centerTitle,
      style: TextStyles.rem26Bold,
    ),
    centerTitle: true,
    actionsPadding: EdgeInsets.only(right: 18),
    actions: actions,
  );
}
