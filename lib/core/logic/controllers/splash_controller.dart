import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/widgets/constant.dart';
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
    log(CacheHelper.userBox.get(kDarkMode).toString());
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
      } else if (authBox.get(kuserToken) == null) {
        log('token:  ${authBox.get(kuserToken)}');
        Get.toNamed(Routes.loginView);
      } else {
        Get.toNamed(Routes.mainView);
      }
    });
  }
}
