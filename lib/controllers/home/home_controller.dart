import 'dart:async';

import 'package:get/get.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class HomeController extends GetxController {
  @override
  onInit() {
    moveEyes();
    super.onInit();
  }

  // ************************* Move Eyes ***********************************
  int currentEyeIndex = 0;
  Timer? timer;
  List<String> eyesList = const [
    Assets.imagesSvgLookEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgHalfEye,
  ];
  moveEyes() {
    timer = Timer.periodic(
      const Duration(milliseconds: 250),
      (_) {
        if (currentEyeIndex < eyesList.length - 1) {
          currentEyeIndex++;
          update();
        } else {
          currentEyeIndex = 0;
          update();
        }
      },
    );
  }
}
