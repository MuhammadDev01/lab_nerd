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
  int questionIndex = 1;
  void selectRandomQuestion(List<QuestionModel> questions) {
    isUserAnswered = false;
    var index = Random().nextInt(questions.length);
    if (!answeredQuestions.contains(questions[index].id)) {
      answeredQuestions.add(questions[index].id);
      question = questions[index];
      question.choices.shuffle();
      questionIndex++;
    } else {
      selectRandomQuestion(questions);
    }
    update();
  }

  //**CHECK ANSWER **\\
  Color? colorButton;
  bool isUserAnswered = false;
  String userAnswer = '';
  int score = 0;
  checkAnswer(String userAnswer) {
    isUserAnswered = true;
    userAnswer == question.answer ? score++ : score;
    this.userAnswer = userAnswer;
    update();
  }

//**GET BUTTON COLOR **\\
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
}
