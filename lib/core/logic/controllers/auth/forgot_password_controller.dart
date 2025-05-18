import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';

class ForgotPasswordController extends GetxController {
  bool isLoading = false;

  Future<void> sendPasswordResetEmail(String email) async {
    isLoading = true;
    update();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      appSnackbar(
        title: "Success",
        message: "sent successfully check your email",
        backgroundColor: ColorsManager.successColor,
      );
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      appSnackbar(
        title: "Failed",
        message: "${e.code}.......${e.message}",
        backgroundColor: ColorsManager.errorColor,
      );
      update();
    } catch (e) {
      appSnackbar(
        title: "Failed",
        message: e.toString(),
        backgroundColor: ColorsManager.errorColor,
      );
      update();
    }
    isLoading = false;
    update();
  }
}
