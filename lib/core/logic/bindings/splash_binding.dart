import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}
