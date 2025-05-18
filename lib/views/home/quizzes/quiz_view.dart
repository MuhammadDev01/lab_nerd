import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/home/quizzes/score_quiz_view.dart';
import 'package:lab_nerd/widgets/default_button.dart';

class QuizView extends StatefulWidget {
  const QuizView({
    super.key,
    required this.quizType,
  });
  final String quizType;

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final controller = Get.find<QuizzesController>();
  @override
  void initState() {
    controller.setupQuestions(widget.quizType);
    controller.generateQuestion();
    controller.answeredQuestions.clear();
    controller.questionIndex = 1;
    controller.score = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesQuizBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          GetBuilder<QuizzesController>(
            builder: (_) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150.h,
                    ),
                    Text(
                      controller.question.question,
                      style:
                          TextStyles.rem20Boldd.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    ...controller.question.choices.map(
                      (choice) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: DefaultButton(
                          onPressed: () => controller.isUserAnswered
                              ? null
                              : controller.checkAnswer(choice),
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
                    controller.questionIndex == 10
                        ? ElevatedButton(
                            onPressed: () => Get.off(
                                () => ScoreQuizView(score: controller.score)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: Text(
                              "Finish",
                              style: TextStyles.rem16Bold
                                  .copyWith(color: Colors.black),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () => controller.nextQuestion(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: Text(
                              "Next Question",
                              style: TextStyles.rem16Bold
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                    SizedBox(height: 40.h),
                    Text(
                      "Question: ${controller.questionIndex}/10",
                      style: TextStyles.slacksideOnes20Bold.copyWith(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
