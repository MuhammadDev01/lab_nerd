import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/models/question_model.dart';
import 'package:lab_nerd/core/utils/constant.dart';

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
    //debugPrint("Questions Fetched ✅");
    update();
  }

//**SETUP QUESTIONS & GENERATE QUESTION **\\
  List<int> answeredQuestions = [];
  late QuestionModel question;
  int questionIndex = 0;
  List<QuestionModel> currentQuestions = [];

  void setupQuestions(String? quizType) {
    switch (quizType) {
      case kSymbols:
        currentQuestions = symbolsQuestions;
        break;
      case kAtomicNumber:
        currentQuestions = atomicNumberQuestions;
        break;
      case kBalanceChemicalEquations:
        currentQuestions = balanceChemicalEquationsQuestions;
        break;
      case kChemistryReactions:
        currentQuestions = chemistryReactionQuestions;
        break;
      default:
        currentQuestions = allQuestions;
    }
  }

  void generateQuestion() {
    isUserAnswered = false;
    //debugPrint('${currentQuestions.length}✅');
    var index = Random().nextInt(currentQuestions.length);
    //debugPrint('${currentQuestions.length}✅');
    if (!answeredQuestions.contains(currentQuestions[index].id)) {
      answeredQuestions.add(currentQuestions[index].id);
      //debugPrint('${answeredQuestions.toString()}✅');

      question = currentQuestions[index];
      question.choices.shuffle();
      questionIndex++;
    } else {
      generateQuestion();
    }
  }

  void nextQuestion() {
    generateQuestion();
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
