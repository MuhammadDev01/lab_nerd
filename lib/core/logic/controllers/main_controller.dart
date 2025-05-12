import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/models/element_model.dart';
import 'package:lab_nerd/models/questions_model.dart';
import 'package:lab_nerd/models/exam_model.dart';
import 'package:lab_nerd/models/user_profile_model.dart';
import 'package:lab_nerd/views/exams/exams_view.dart';
import 'package:lab_nerd/views/periodic_table/periodic_table_view.dart';
import 'package:lab_nerd/views/settings/settings_view.dart';
import 'package:lab_nerd/views/home/home_view.dart';

class Maincontroller extends GetxController {
  bool isLoading = false;
  int currentIndex = 0;

  @override
  onInit() async {
    showProfileUser();
    await loadJsonData();
    super.onInit();
  }

  List<Widget> views = const [
    HomeView(),
    PeriodicTableView(),
    ExamsView(),
    SettingsView(),
  ];

  //*****************DEFAULT*****************\\
  void changeIndexNav(int index) {
    currentIndex = index;
    update();
  }

  void changeLoading() {
    isLoading = !isLoading;
    update();
  }

  //*****************SHOW PROFILE USER*****************\\

  final user = FirebaseAuth.instance.currentUser;
  late ProfileUserModel userPofile;
  showProfileUser() {
    userPofile = ProfileUserModel(
      name: user?.displayName,
      email: user?.email,
    );
    update();
  }

  //*****************DARK MODE*****************\\
  bool isDark = false;
  Color colorDarkLight =
      CacheHelper.userBox.get(kDarkMode) ? Colors.white : Colors.black;
  Color colorBottomActive = CacheHelper.userBox.get(kDarkMode)
      ? ColorsManager.greenWhite
      : Color(0xff2896E8);
  void switchDarkMode() {
    isDark = !isDark;
    colorDarkLight = isDark ? Colors.white : Colors.black;
    colorBottomActive = isDark ? ColorsManager.greenWhite : Color(0xff2896E8);
    CacheHelper.userBox.put(kDarkMode, isDark).then((_) {
      Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    });
    update();
  }

//*****************ELEMENTS******************\\
  static List<ElementModel> elementsList = [];

  Future<List<ElementModel>> loadJsonData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/periodic-table.json');
    var jsonData = jsonDecode(jsonString);
    var elements = jsonData['elements'] as List<dynamic>;
    for (var element in elements) {
      elementsList.add(ElementModel.fromJson(element));
    }
    return elementsList;
  }

  List<ExamModel> examsList = [];
  // List<ExamModel> getExams() {
  //   if (examsList.isEmpty) {
  //     DioHelper.getData(
  //             url: '${CachedHelper.getData(key: 'url')}/api/quiz/subject')
  //         .then((value) {
  //       for (var element in value.data['data']) {
  //         ExamModel model = ExamModel.fromJson(element);
  //         examsList.add(model);
  //       }
  //       update();
  //     });
  //   }

  //   return examsList;
  // }

  int? examID;
  String currentQuestion = '';
  late List<AnswerModel> currentAnswers = [];
  late List<Color> buttonColors = List.generate(4, (_) {
    return Get.isDarkMode ? Colors.black : Colors.white;
  });

  //bool isAnswered = false;
  List<int> questionsIDList = [];
  List<QuestionsModel> questionsList = [];
  int i = 0;
  int trueAnswerd = 0;
  // void getQuestionsOfExam() async {
  //   if (questionsList.isEmpty) {
  //     await DioHelper.getData(
  //             url:
  //                 '${CachedHelper.getData(key: 'url')}/api/quiz/subject/$examID')
  //         .then((value) {
  //       for (var question in value.data['data']['questions']) {
  //         QuestionssModel model = QuestionssModel.fromJson(question);
  //         questionsIDList.add(model.id!);
  //       }
  //     });
  //     for (int i = 0; i < questionsIDList.length; i++) {
  //       await DioHelper.getData(
  //               url:
  //                   '${CachedHelper.getData(key: 'url')}/api/quiz/questions/${questionsIDList[i]}')
  //           .then((value) {
  //         QuestionsModel model = QuestionsModel.fromJson(value.data['data']);
  //         questionsList.add(model);
  //       });
  //     }
  //     questionsIDList.shuffle();
  //     update();
  //   }
  //   if (i < questionsList.length) {
  //     currentQuestion = questionsList[i].question!;
  //     currentAnswers = List.from(questionsList[i].answer);
  //     currentAnswers.shuffle();
  //   }
  // }

  void checkAnswer(bool userAnswer, int selectedIndex) {
    if (userAnswer) {
      // Correct answer
      buttonColors[selectedIndex] = Colors.green;
      trueAnswerd++;
      update();
    } else {
      // Incorrect answer
      buttonColors[selectedIndex] =
          Get.isDarkMode ? Colors.deepOrange.shade900 : Colors.red;
      for (int i = 0; i < currentAnswers.length; i++) {
        if (currentAnswers[i].isCorrect) {
          buttonColors[i] = Get.isDarkMode ? Colors.teal : Colors.green;
          break;
        }
      }
      update();
    }
  }

  bool isEnglish = false;
  void changeLang() {
    isEnglish = !isEnglish;
    update();
  }
}
