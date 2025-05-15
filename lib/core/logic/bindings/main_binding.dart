import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/home_controller.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/logic/controllers/home/search_elements_controller.dart';
import 'package:lab_nerd/core/logic/controllers/settings_controller.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/logic/controllers/home/notes_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Maincontroller());
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.put(NotesController());
    Get.lazyPut(() => SettingsController(), fenix: true);
    Get.lazyPut(() => SearchElementsController(), fenix: true);
    Get.put(QuizzesController());
  }
}
