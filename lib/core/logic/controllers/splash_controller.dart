import 'dart:async';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class SplashController extends GetxController {
  int currentIndex = 0;
  Timer? _timer;
  var authBox = Hive.box(kAuthBox);
  @override
  void onInit() {
    moveEyes();
    navigateToWhere();
    super.onInit();
  }

  final List<String> splashEyes = const [
    Assets.imagesSvgLookEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgHalfEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgHalfEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgLookEye,
  ];

  moveEyes() {
    _timer = Timer.periodic(const Duration(milliseconds: 150), (Timer timer) {
      if (currentIndex < splashEyes.length - 1) {
        currentIndex++;
        update();
      } else {
        _timer?.cancel();
        update();
      }
    });
  }

  navigateToWhere() {
    Future.delayed(const Duration(seconds: 2), () {
      if (authBox.get(kOnBoarding) == null) {
        Get.toNamed(Routes.onBoardingView);
      } else if (authBox.get(kuserToken) != null) {
        Get.toNamed(Routes.homeView);
      } else {
        Get.toNamed(Routes.loginView);
      }
    });
    // if (authBox.get(kOnBoarding) == null) {
    //   authBox.put(kOnBoarding, true);
    //   Get.toNamed(Routes.onBoardingView);
    // } else if (authBox.get(kuserToken) != null) {
    //   Get.toNamed(Routes.homeView);
    // } else {
    //   Get.toNamed(Routes.loginView);
    // }
  }
}
