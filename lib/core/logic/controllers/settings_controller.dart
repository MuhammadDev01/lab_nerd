import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/helper/componants.dart';
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
}
