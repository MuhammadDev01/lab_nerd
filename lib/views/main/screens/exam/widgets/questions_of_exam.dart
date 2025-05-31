import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/main/screens/exam/widgets/exam_score_view.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/widgets/finish_button.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/widgets/next_question_button.dart';

class QuestionsOfExam extends StatelessWidget {
  const QuestionsOfExam({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
      builder: (controller) => Column(
        spacing: 10,
        children: [
          Text(
            controller.question.question,
            style: TextStyles.rem26Bold,
            textAlign: TextAlign.center,
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
              padding: EdgeInsets.symmetric(vertical: 12),
              disabledColor: Colors.grey[300],
              onSelected: (_) {
                controller.isUserAnswered
                    ? null
                    : controller.checkAnswer(choice);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }),
          SizedBox(height: 10),
          controller.questionIndex == 50
              ? FinishButton(
                  onPressed: () => Get.off(() => ExamScoreView()),
                )
              : NextQuestionButton(),
          SizedBox(height: 5),
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
