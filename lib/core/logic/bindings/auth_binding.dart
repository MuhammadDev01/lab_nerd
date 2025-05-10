import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/logic/controllers/auth/sign_up_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SignUpController(),
      fenix: true,
    );
  }
}
