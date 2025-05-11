import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/home_controller.dart';
import 'package:lab_nerd/core/logic/controllers/home/settings_controller.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/logic/controllers/notes_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Maincontroller());
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => NotesController(), fenix: true);
    Get.lazyPut(() => SettingsController(), fenix: true);
  }
}
