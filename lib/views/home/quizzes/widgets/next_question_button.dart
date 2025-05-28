import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/global_helper.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/widgets/custom_app_button.dart';

class NextQuestionButton extends StatelessWidget {
  const NextQuestionButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
      builder: (controller) => CustomAppButton(
        width: GlobalHelper.isTablet ? 130.w : 80.w,
        height: GlobalHelper.isTablet ? 80.h : 50.h,
        onPressed: () => controller.nextQuestion(),
        colorButton: ColorsManager.greenWhite,
        child: Text(
          "Next Question",
          style: TextStyles.rem20Bold.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
