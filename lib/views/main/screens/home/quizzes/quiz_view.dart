import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/score_quiz_view.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/widgets/quiz_choices.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/widgets/finish_button.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/widgets/next_question_button.dart';

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
    final isTalet = MediaQuery.sizeOf(context).width > 600;
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      controller.question.question,
                      style: TextStyles.rem20Bold.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        children: [
                          QuizChoices(),
                          SizedBox(
                            height: isTalet ? 60.h : 35.h,
                          ),
                          controller.questionIndex == 10
                              ? FinishButton(
                                  onPressed: () => Get.off(() =>
                                      ScoreQuizView(score: controller.score)),
                                )
                              : NextQuestionButton(),
                          Text(
                            "Question: ${controller.questionIndex}/10",
                            style: TextStyles.slacksideOnes20Bold.copyWith(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
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
