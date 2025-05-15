import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/exam/widgets/exam_timer.dart';
import 'package:lab_nerd/views/exam/widgets/score_exam_view.dart';
import 'package:lab_nerd/widgets/default_button.dart';

import '../../../core/logic/controllers/home/quizzes_controller.dart';

class StartExamView extends StatefulWidget {
  const StartExamView({
    super.key,
  });

  @override
  State<StartExamView> createState() => _StartExamViewState();
}

class _StartExamViewState extends State<StartExamView> {
  final controller = Get.find<QuizzesController>();

  @override
  void initState() {
    controller.setupQuestions(null);
    controller.generateQuestion();
    controller.answeredQuestions.clear();
    controller.questionIndex = 1;
    controller.score = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
      builder: (_) => Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              Assets.imagesExamBackground,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ExamTimer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150.h,
                    ),
                    Text(
                      controller.question.question,
                      style: TextStyles.poppins32Bold.copyWith(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    ...controller.question.choices.map(
                      (choice) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: DefaultButton(
                          onPressed: () {
                            controller.isUserAnswered
                                ? null
                                : controller.checkAnswer(choice);
                          },
                          colorButton: controller.getButtonColor(choice),
                          child: Text(
                            choice,
                            style: TextStyles.rem16Bold.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    controller.questionIndex == 50
                        ? _finishButton()
                        : _goToNextQuestionButton(),
                    SizedBox(height: 40.h),
                    Text(
                      "Question: ${controller.questionIndex}/50",
                      style: TextStyles.slacksideOnes20Bold.copyWith(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _goToNextQuestionButton() {
    return ElevatedButton(
      onPressed: () => controller.nextQuestion(),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
      child: Text(
        "Next Question",
        style: TextStyles.rem16Bold.copyWith(color: Colors.black),
      ),
    );
  }

  ElevatedButton _finishButton() {
    return ElevatedButton(
      onPressed: () => Get.off(() => ScoreExamView(score: controller.score)),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
      child: Text(
        "Finish",
        style: TextStyles.rem16Bold.copyWith(color: Colors.black),
      ),
    );
  }
}
