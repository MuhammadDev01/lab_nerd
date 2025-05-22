import 'dart:async';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/widgets/constant.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class SplashController extends GetxController {
  RxInt currentIndex = 0.obs;
  Timer? _timer;
  @override
  void onInit() async {
    _animationLogo();
    await _navigateToWhere();
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  final List<String> splashEyes = const [
    Assets.imagesSvgLookEye,
    Assets.imagesSvgHalfEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgHalfEye,
    Assets.imagesSvgLookEye,
  ];

  _animationLogo() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (Timer timer) {
      if (currentIndex.value < splashEyes.length - 1) {
        currentIndex.value++;
      }
    });
  }

  Future<void> _navigateToWhere() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (CacheHelper.authBox.get(kOnBoarding) == null) {
        Get.toNamed(Routes.onBoardingView);
      } else if (CacheHelper.authBox.get(kuserToken) == null) {
        Get.toNamed(Routes.authView);
      } else {
        Get.toNamed(Routes.mainView);
      }
    });
  }
}
