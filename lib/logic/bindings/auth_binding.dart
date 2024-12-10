import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/login_controller.dart';
import 'package:lab_nerd/logic/controllers/register_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(RegisterController());
  }
}
