import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/app_controller.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';

class QuizesView extends StatefulWidget {
  const QuizesView({
    super.key,
  });
  @override
  State<QuizesView> createState() => _QuizesViewState();
}

class _QuizesViewState extends State<QuizesView> {
  bool isAnswered = false;
  Appcontroller controller = Get.find<Appcontroller>();

  @override
  void initState() {
    super.initState();
    {
      if (controller.examID != null) {
        controller.getQuestionsOfExam();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GetBuilder<Appcontroller>(
        builder: (_) => controller.questionsList.isEmpty
            ? const LoadingWidget()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.i == controller.questionsList.length
                      ? Column(
                          children: [
                            Text(
                              'Finished!',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 28,
                                  ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Your Score : ${controller.trueAnswerd}/${controller.questionsList.length}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 28,
                                  ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(50, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                if (controller.currentIndex != 3) {
                                  controller.changeIndexNav(3);
                                  controller.i = 0;
                                  controller.questionsList.clear();
                                  controller.questionsIDList.clear();
                                  controller.trueAnswerd = 0;
                                  controller.examID = null;
                                }
                              },
                              child: Text(
                                'Again',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontSize: 28,
                                      color: Colors.indigo,
                                    ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Text(
                              controller.currentQuestion,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(height: 20.0),
                            Column(
                              children: List.generate(
                                4,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        isAnswered = true;
                                      });
                                      controller.checkAnswer(
                                          controller
                                              .currentAnswers[index].isCorrect,
                                          index);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      maximumSize: const Size.fromHeight(50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      backgroundColor:
                                          controller.buttonColors[index],
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        controller.currentAnswers[index].answer,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: isAnswered
                                  ? () {
                                      setState(() {
                                        isAnswered = false;
                                        if (controller.examID != null) {
                                          controller.buttonColors =
                                              List.generate(4, (_) {
                                            return Get.isDarkMode
                                                ? Colors.black
                                                : Colors.white;
                                          });
                                          controller.i++;
                                          controller.getQuestionsOfExam();
                                        } else {
                                          //generateRandomQuestions();
                                        }
                                      });
                                    }
                                  : null,
                              child: Text(
                                'Next ->',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
      );
    });
  }

  // void generateRandomQuestions() {
  //   final random = Random();
  //   final randomIndex = random.nextInt(widget.quizes!.length);
  //   currentQuestion = widget.quizes?[randomIndex].question!;
  //   //correctAnswer = widget.quizes[randomIndex].answer;
  //   currentAnswers = List.from(widget.quizes[randomIndex].answer);
  //   currentAnswers.shuffle();
  //   buttonColors =
  //       List.generate(4, (_) => Get.isDarkMode ? Colors.brown : Colors.white);
  // }

  // void generateRandomElementQuestions(int index) {
  //   final random = Random();
  //   final randomIndex = random.nextInt(5);
  //   currentQuestion = ExamModel[index].questions[randomIndex];
  //   correctAnswer = ExamModel[index].correctAnswers[randomIndex];
  //   currentAnswers = List.from(ExamModel[index].options![randomIndex]);
  //   currentAnswers.shuffle();
  //   buttonColors = List.generate(4, (_) => Colors.white);
  // }
}
