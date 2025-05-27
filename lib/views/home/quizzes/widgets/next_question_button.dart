import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class NextQuestionButton extends StatelessWidget {
  const NextQuestionButton({super.key, required this.controller});
  final QuizzesController controller;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => controller.nextQuestion(),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(12),
        backgroundColor: ColorsManager.greenWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Text(
        "Next Question",
        style: TextStyles.rem16SemiBold.copyWith(color: Colors.black),
      ),
    );
  }
}
