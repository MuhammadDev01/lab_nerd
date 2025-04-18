import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Appcontroller());
  }
}
