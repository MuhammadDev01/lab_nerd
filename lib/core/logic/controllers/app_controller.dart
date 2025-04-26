import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/cached_helper.dart';
import 'package:lab_nerd/models/element_model.dart';
import 'package:lab_nerd/models/questions_model.dart';
import 'package:lab_nerd/models/login_with_back_model.dart';
import 'package:lab_nerd/models/exam_model.dart';
import 'package:lab_nerd/models/user_profile_model.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/exams/exams_view.dart';
import 'package:lab_nerd/views/periodic_table/periodic_table_view.dart';
import 'package:lab_nerd/views/settings/settings_view.dart';
import 'package:lab_nerd/views/home/unity_view.dart';

class Appcontroller extends GetxController {
  bool isLoading = false;
  int currentIndex = 0;

  List<Widget> pages = const [
    HomeView(),
    PeriodicTableView(),
    ExamsView(),
    SettingsView(),
  ];

  ProfileUserModel? profileUser;
  // Future<void> showProfileUser() async {
  //   DioHelper.getData(url: '${CachedHelper.getData(key: 'url')}/api/profile')
  //       .then((value) {
  //     profileUser = ProfileUserModel.fromJson(value.data);
  //     update();
  //   });
  // }

  LoginWithBackModel? changePassModel;
  // Future<void> changePasswordUser({
  //   required String currentPassword,
  //   required String newPassword,
  //   required String confirmPassword,
  // }) async {
  //   await DioHelper.postData(
  //       url: '${CachedHelper.getData(key: 'url')}/api/change-user-password',
  //       data: {
  //         'current_password': currentPassword,
  //         'password': newPassword,
  //         'password_confirmation': confirmPassword,
  //       }).then((value) {
  //     changePassModel = LoginWithBackModel.fromJson(value.data);
  //     update();
  //     Get.snackbar(
  //       'Success',
  //       changePassModel!.message!,
  //       backgroundColor: Colors.teal,
  //       colorText: Colors.white,
  //     );
  //   }).catchError((error) {
  //     update();
  //     Get.snackbar('Error', error.toString());
  //   });
  // }

  // Future<void> changeNameAndEmail({
  //   required String username,
  //   required String email,
  // }) async {
  //   await DioHelper.putData(
  //       url: '${CachedHelper.getData(key: 'url')}/api/update-email',
  //       data: {
  //         'name': username,
  //         'email': email,
  //       }).then((value) async {
  //     await showProfileUser();
  //     update();
  //     Get.back();
  //   }).catchError((error) {
  //     update();
  //     Get.snackbar('Error', error.toString());
  //   });

  void changeIndexNav(int index) {
    currentIndex = index;
    update();
  }

  void changeLoading() {
    isLoading = !isLoading;
    update();
  }

  //bool isDark = false;
  String backgroundHome = CachedHelper.getData(key: 'isDark')
      ? Assets.imagesSvgBackgroundBlack
      : Assets.imagesSvgBackgroundLight;
  Color color = CachedHelper.getData(key: 'isDark')
      ? Colors.black54
      : Colors.grey.shade100;
  changeThemeMode(bool isdark) async {
    isdark = !isdark;
    //isDark = isdark;
    await CachedHelper.saveData(key: 'isDark', value: isdark);
    backgroundHome = isdark
        ? Assets.imagesSvgBackgroundBlack
        : Assets.imagesSvgBackgroundLight;
    color = isdark ? Colors.black54 : Colors.grey.shade100;
    update();
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

  List<ElementModel> elementsList = [];
  // Future<void> getSearchOfElements({
  //   required String nameElement,
  //   required String sortType,
  // }) async {
  //   if (elementsList.isNotEmpty) elementsList.clear();
  //   await DioHelper.postData(
  //           url: '${CachedHelper.getData(key: 'url')}/api/all-elements',
  //           data: {'search': nameElement, 'sort': 'name', 'order': sortType})
  //       .then((value) {
  //     for (var element in value.data['data']) {
  //       elementsList.add(ElementModel.fromJson(element));
  //     }
  //   });
  //   update();
  // }

//*signout
  // void signoutFromApp() async {
  //   await DioHelper.postData(
  //       url: '${CachedHelper.getData(key: 'url')}/api/logout',
  //       data: {}).then((value) {
  //     CachedHelper.removeData(key: kOnLogging);
  //     Get.offNamed(Routes.loginView);
  //     update();
  //   });
  // }

  bool isVisibilty = true;
  IconData visibilityPassword = Icons.visibility_off;
  void visibilty() {
    isVisibilty = !isVisibilty;
    visibilityPassword = isVisibilty ? Icons.visibility_off : Icons.visibility;
    update();
  }

  bool isEnglish = false;
  void changeLang() {
    isEnglish = !isEnglish;
    update();
  }
}
