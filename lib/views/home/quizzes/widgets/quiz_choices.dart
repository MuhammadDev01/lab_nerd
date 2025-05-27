import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class QuizChoices extends StatelessWidget {
  const QuizChoices({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    return GetBuilder<QuizzesController>(
      builder: (controller) => Column(
        spacing: isTablet ? 60.h : 30.h,
        children: controller.question.choices.map((choice) {
          return ChoiceChip(
            label: Center(
              child: Text(
                choice,
                style: TextStyles.rem16SemiBold.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            showCheckmark: false,
            color: WidgetStatePropertyAll(controller.getButtonColor(choice)),
            selected: controller.isUserAnswered,
            selectedColor: controller.getButtonColor(choice),
            backgroundColor: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: isTablet ? 30.h : 15.h),
            disabledColor: Colors.grey[300],
            onSelected: (_) {
              controller.isUserAnswered ? null : controller.checkAnswer(choice);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          );
        }).toList(),
      ),
    );
  }
}
