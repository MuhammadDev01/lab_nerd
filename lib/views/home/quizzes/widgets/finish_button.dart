import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/home/quizzes/score_quiz_view.dart';
import 'package:lab_nerd/widgets/custom_app_button.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({super.key, required this.controller});
  final QuizzesController controller;
  @override
  Widget build(BuildContext context) {
    return CustomAppButton(
      width: 60.w,
      height: 60.h,
      onPressed: () => Get.off(() => ScoreQuizView(score: controller.score)),
      colorButton: ColorsManager.greenWhite,
      child: Text(
        "Finish",
        style: TextStyles.rem16SemiBold.copyWith(color: Colors.black),
      ),
    );
  }
}
