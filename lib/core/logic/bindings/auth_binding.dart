import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/forgot_password_controller.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/logic/controllers/auth/sign_up_controller.dart';
import 'package:lab_nerd/repos/sign_up_repo.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SignUpController(SignUpRepo()),
      fenix: true,
    );
    Get.lazyPut(
      () => ForgotPasswordController(),
      fenix: true,
    );
  }
}
