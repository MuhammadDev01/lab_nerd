import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/views/home/home_view.dart';
import 'package:lab_nerd/widgets/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/models/element_model.dart';
import 'package:lab_nerd/models/user_profile_model.dart';
import 'package:lab_nerd/views/exam/exam_view.dart';
import 'package:lab_nerd/views/periodic_table/periodic_table_view.dart';
import 'package:lab_nerd/views/settings/settings_view.dart';

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
  static late ProfileUserModel userPofile;
  showProfileUser() {
    userPofile = ProfileUserModel(
      name: user?.displayName,
      email: user?.email,
    );
    update();
  }

  //*****************DARK MODE*****************\\
  late bool isDark;
  Color colorDarkLight =
      CacheHelper.userBox.get(kDarkMode) ? Colors.white : Colors.black;
  Color colorBottomActive = CacheHelper.userBox.get(kDarkMode)
      ? ColorsManager.greenWhite
      : Color(0xff2896E8);
  Future<void> changeTheme() async {
    isDark = CacheHelper.userBox.get(kDarkMode);
    await CacheHelper.userBox.put(kDarkMode, !isDark).then((_) {
      isDark = CacheHelper.userBox.get(kDarkMode);
      colorDarkLight = isDark ? Colors.white : Colors.black;
      colorBottomActive = isDark ? ColorsManager.greenWhite : Color(0xff2896E8);
      Get.changeThemeMode(CacheHelper.userBox.get(kDarkMode)
          ? ThemeMode.dark
          : ThemeMode.light);
    });
    log(CacheHelper.userBox.get(kDarkMode).toString());
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

  bool isEnglish = false;
  int? examID;
  void changeLang() {
    isEnglish = !isEnglish;
    update();
  }
}
