import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/exam/widgets/score_exam_view.dart';
import 'package:lab_nerd/widgets/constant.dart';
import 'package:lab_nerd/widgets/custom_app_button.dart';

class QuestionsOfExam extends StatelessWidget {
  QuestionsOfExam({super.key});
  final controller = Get.find<QuizzesController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Text(
          controller.question.question,
          style: TextStyle(
            color: Colors.white,
            fontSize: 8.sp,
            fontFamily: fontPoppins,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.h,
        ),
        ...controller.question.choices.map(
          (choice) => Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: CustomAppButton(
              width: 150.w,
              onPressed: () {
                controller.isUserAnswered
                    ? null
                    : controller.checkAnswer(choice);
              },
              colorButton: controller.getButtonColor(choice),
              child: Text(
                choice,
                style: TextStyles.rem16SemiBold,
              ),
            ),
          ),
        ),
        controller.questionIndex == 50
            ? _finishButton()
            : _goToNextQuestionButton(),
        FittedBox(
          child: Text(
            "Question: ${controller.questionIndex}/50",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: fontSlacksideOne,
            ),
          ),
        ),
      ],
    );
  }

  ElevatedButton _goToNextQuestionButton() {
    return ElevatedButton(
      onPressed: () => controller.nextQuestion(),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
      child: Text(
        "Next Question",
        style: TextStyles.rem16SemiBold.copyWith(color: Colors.black),
      ),
    );
  }

  ElevatedButton _finishButton() {
    return ElevatedButton(
      onPressed: () => Get.off(() => ScoreExamView(score: controller.score)),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
      child: Text(
        "Finish",
        style: TextStyles.rem16SemiBold.copyWith(color: Colors.black),
      ),
    );
  }
}
