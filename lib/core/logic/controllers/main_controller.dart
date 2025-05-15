import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/widgets/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/models/element_model.dart';
import 'package:lab_nerd/models/exam_model.dart';
import 'package:lab_nerd/models/user_profile_model.dart';
import 'package:lab_nerd/views/exam/exam_view.dart';
import 'package:lab_nerd/views/periodic_table/periodic_table_view.dart';
import 'package:lab_nerd/views/settings/settings_view.dart';
import 'package:lab_nerd/views/home/home_view.dart';

class Maincontroller extends GetxController {
  bool isLoading = false;
  int currentIndex = 0;

  @override
  onInit() async {
    showProfileUser();
    await loadElements();
    super.onInit();
  }

  List<Widget> views = const [
    HomeView(),
    PeriodicTableView(),
    ExamView(),
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

  Future<List<ElementModel>> loadElements() async {
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

  bool isEnglish = false;
  int? examID;
  void changeLang() {
    isEnglish = !isEnglish;
    update();
  }
}
