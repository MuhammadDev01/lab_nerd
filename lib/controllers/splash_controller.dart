import 'dart:async';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/app_get_updates.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/constant.dart';
import 'package:lab_nerd/data/local_data.dart';

class SplashController extends GetxController {
  int currentIndex = 0;
  Timer? _timer;

  @override
  void onInit() async {
    _animateLogo();
    await _goToNext();

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

  void _animateLogo() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      if (currentIndex < splashEyes.length - 1) {
        currentIndex++;
        update([AppGetBuilderId.splashAnimateLogo]);
      }
    });
  }

  Future<void> _goToNext() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (LocalData.authBox.get(kOnBoarding) == null) {
        Get.toNamed(Routes.onBoardingView);
      } else if (LocalData.authBox.get(kuserToken) == null) {
        Get.toNamed(Routes.authView);
      } else {
        Get.toNamed(Routes.mainView);
      }
    });
  }
}
