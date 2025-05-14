import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/models/question_model.dart';

class QuizzesController extends GetxController {
  @override
  onInit() async {
    await loadQuestions();
    super.onInit();
  }

  //**LOAD QUESTIONS **\\
  List<QuestionModel> allQuestions = [];
  List<QuestionModel> symbolsQuestions = [];
  List<QuestionModel> atomicNumberQuestions = [];
  List<QuestionModel> balanceChemicalEquationsQuestions = [];
  List<QuestionModel> chemistryReactionQuestions = [];
  Future<void> loadQuestions() async {
    String jsonString =
        await rootBundle.loadString('assets/data/chemistry_questions.json');
    var jsonData = jsonDecode(jsonString);

    //**SYMBOLS **\\
    List<dynamic> questions = jsonData['Symbols'];
    for (var question in questions) {
      symbolsQuestions.add(QuestionModel.fromJson(question));
    }
    allQuestions.addAll(symbolsQuestions);

    //**ATOMIC NUMBERS**\\
    questions = jsonData['Atomic_number'];
    for (var question in questions) {
      atomicNumberQuestions.add(QuestionModel.fromJson(question));
    }
    allQuestions.addAll(atomicNumberQuestions);

    //**BALANCE CHEMICAL EQUATIONS**\\
    questions = jsonData['Balance_chemical_equations'];
    for (var question in questions) {
      balanceChemicalEquationsQuestions.add(QuestionModel.fromJson(question));
    }
    allQuestions.addAll(balanceChemicalEquationsQuestions);

    //**CHEMISTRY REACTIONS**\\
    questions = jsonData['chemistry_reaction_questions'];
    for (var question in questions) {
      chemistryReactionQuestions.add(QuestionModel.fromJson(question));
    }
    allQuestions.addAll(chemistryReactionQuestions);
    debugPrint("Questions Fetched ✅");
    update();
  }

//**SELECT RANDOM QUESTION **\\
  List<int> answeredQuestions = [];
  late QuestionModel question;
  void selectRandomQuestion(List<QuestionModel> questions) {
    isUserAnswered = false;
    var index = Random().nextInt(questions.length);
    if (!answeredQuestions.contains(questions[index].id)) {
      answeredQuestions.add(questions[index].id);
      question = questions[index];
      debugPrint('QUESTION: ${question.question}');
      question.choices.shuffle();
      debugPrint('CHOICES: ${question.choices.toString()}');
    } else {
      selectRandomQuestion(questions);
    }
    update();
  }

  //**CHECK ANSWER **\\
  Color? colorButton;
  bool isUserAnswered = false;
  String userAnswer = '';
  checkAnswer(String userAnswer) {
    isUserAnswered = true;
    this.userAnswer = userAnswer;
    update();
  }

  Color getButtonColor(String choice) {
    if (isUserAnswered) {
      if (choice == question.answer) {
        return ColorsManager.successColor;
      } else if (choice == userAnswer) {
        return ColorsManager.errorColor;
      }
      return Colors.white;
    } else {
      return Colors.white;
    }
  }

//   void checkAnswer(bool userAnswer, int selectedIndex) {
//     if (userAnswer) {
//       // Correct answer
//       buttonColors[selectedIndex] = Colors.green;
//       trueAnswerd++;
//       update();
//     } else {
//       // Incorrect answer
//       buttonColors[selectedIndex] =
//           Get.isDarkMode ? Colors.deepOrange.shade900 : Colors.red;
//       for (int i = 0; i < currentAnswers.length; i++) {
//         if (true) {
// //currentAnswers[i].isCorrect
//           buttonColors[i] = Get.isDarkMode ? Colors.teal : Colors.green;
//           break;
//         }
//       }
//       update();
//     }
//   }

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
