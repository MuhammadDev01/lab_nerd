import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/global_helper.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/exam/widgets/exam_score_view.dart';
import 'package:lab_nerd/views/home/quizzes/widgets/finish_button.dart';
import 'package:lab_nerd/views/home/quizzes/widgets/next_question_button.dart';

class QuestionsOfExam extends StatelessWidget {
  const QuestionsOfExam({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
      builder: (controller) => Column(
        spacing: GlobalHelper.isTablet ? 20.h : 10.h,
        children: [
          Text(
            controller.question.question,
            style: TextStyles.rem26Bold,
            textAlign: TextAlign.center,
          ),
          if (GlobalHelper.isTablet)
            SizedBox(
              height: 20.h,
            ),
          ...controller.question.choices.map((choice) {
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
              padding: EdgeInsets.symmetric(
                  vertical: GlobalHelper.isTablet ? 30.h : 12.h),
              disabledColor: Colors.grey[300],
              onSelected: (_) {
                controller.isUserAnswered
                    ? null
                    : controller.checkAnswer(choice);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            );
          }),
          SizedBox(height: 10.h),
          controller.questionIndex == 50
              ? FinishButton(
                  onPressed: () => Get.off(() => ExamScoreView()),
                )
              : NextQuestionButton(),
          SizedBox(height: 5.h),
          FittedBox(
            child: Text(
              "Question: ${controller.questionIndex}/50",
              style: TextStyles.rem26Bold.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
