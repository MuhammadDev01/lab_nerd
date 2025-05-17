import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';

class SettingsController extends GetxController {
  //*************SIGN OUT**************\\
  Future<void> signoutFromApp() async {
    try {
      await FirebaseAuth.instance.signOut();
      await CacheHelper.authBox.clear();
      Get.offAllNamed(Routes.loginView);
    } catch (e) {
      appSnackbar(
        title: 'Failed',
        message: e.toString(),
        backgroundColor: ColorsManager.errorColor,
      );
    }
  }

  //*************CHANGE USERNAME**************\\
  final mainController = Get.find<Maincontroller>();
  RxString? currentUsername = Maincontroller.userPofile.name!.obs;
  RxString? currentEmail = Maincontroller.userPofile.email!.obs;
  final isLoading = false.obs;
  Future<String?> updateUserName(String newUsername) async {
    isLoading(true);
    if (newUsername == Maincontroller.userPofile.name) {
      appSnackbar(
        title: "Can't Update",
        message: 'No changing in current name is happend',
        backgroundColor: ColorsManager.errorColor,
      );
    } else {
      try {
        await mainController.user!.updateProfile(displayName: newUsername);
        await mainController.user!.reload();
        Maincontroller.userPofile.name = newUsername;
        currentUsername!.value = newUsername;
        update();
        isLoading(false);
        return 'Success';
      } catch (e) {
        appSnackbar(
          title: 'Failed',
          message: e.toString(),
          backgroundColor: ColorsManager.errorColor,
        );
        update();
      }
    }
    isLoading(false);
    return null;
  }
}
