import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/models/question_model.dart';
import 'package:lab_nerd/widgets/default_button.dart';

class QuizView extends StatelessWidget {
  final List<QuestionModel> questions;
  const QuizView({
    super.key,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            Image.asset(
              Assets.imagesQuizzesBackround2,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  Text(
                    controller.question.question,
                    style: TextStyles.rem20Boldd.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 200.h,
                  ),
                  ...controller.question.choices.map(
                    (choice) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DefaultButton(
                        onPressed: () => controller.checkAnswer(choice),
                        colorButton: controller.getButtonColor(choice),
                        child: Text(
                          choice,
                          style: TextStyles.rem16Bold.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: getButtonColor(choice),
                      //     padding: EdgeInsets.symmetric(vertical: 12),
                      //   ),
                      //   onPressed: answered ? null : () => checkAnswer(choice),
                      //   child: Text(choice, style: TextStyle(fontSize: 16)),
                      // ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () => controller.selectRandomQuestion(questions),
                    child: Text(
                      "Next Question",
                      style: TextStyles.rem16Bold.copyWith(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
