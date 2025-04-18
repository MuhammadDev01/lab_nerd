import 'dart:async';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/helper/cached_helper.dart';
import 'package:lab_nerd/routes/app_router.dart';

class SplashController extends GetxController {
  int currentIndex = 0;
  Timer? _timer;

  final List<String> splashEyes = const [
    'look.svg',
    'look.svg',
    'half eye.svg',
    'look.svg',
    'look.svg',
    'half eye.svg',
    'look.svg',
    'look.svg',
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

  navigateToWelcome() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (CachedHelper.getData(key: kOnBoarding) == null) {
        Get.offNamed(Routes.onBoardingView);
      } else {
        if (CachedHelper.getData(key: kOnLogging) == null) {
          Get.offNamed(Routes.loginView);
        } else {
          Get.offNamed(Routes.homeView);
        }
      }
    });
  }
}
