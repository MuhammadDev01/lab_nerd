import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/main/screens/exam/widgets/exam_timer.dart';
import 'package:lab_nerd/views/main/screens/exam/widgets/questions_of_exam.dart';

import '../../../../controllers/home/quizzes_controller.dart';

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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          result = await showExitDialog(context);
        }
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                Assets.imagesExamBackground,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExamTimer(),
                QuestionsOfExam(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showExitDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Are you sure?"),
            content: Text("Do you want to exit the exam?"),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text("No"),
              ),
              TextButton(
                onPressed: () => Get.offNamed(Routes.mainView),
                child: Text("Yes"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
