import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/app_get_updates.dart';
import 'package:lab_nerd/core/utils/constant.dart';
import 'package:lab_nerd/data/local_data.dart';

class OnBoardingController extends GetxController {
  final boardingController = PageController();

  bool isLast = false;

  void changePage(bool value) {
    isLast = value;
    update([AppGetBuilderId.onboardingChangePage]);
  }

  Future<void> onPressedFloatingActionButton() async =>
      isLast ? _saveInCacheAndGoToLogin() : _goToNextPage();

  void _goToNextPage() {
    boardingController.nextPage(
      duration: const Duration(
        milliseconds: 600,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  Future<void> _saveInCacheAndGoToLogin() async {
    await LocalData.authBox.put(kOnBoarding, true);
    Get.offNamed(Routes.authView);
  }
}
