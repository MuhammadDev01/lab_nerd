import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/global_helper.dart';
import 'package:lab_nerd/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/components/custom_app_button.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
      builder: (controller) => CustomAppButton(
        width: GlobalHelper.isTablet ? 130.w : 80.w,
        height: GlobalHelper.isTablet ? 80.h : 50.h,
        onPressed: onPressed,
        colorButton: ColorsManager.greenWhiteColor,
        child: Text(
          "Finish",
          style: TextStyles.rem16SemiBold.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
