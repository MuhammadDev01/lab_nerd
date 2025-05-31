import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_nerd/core/helper/app_snack_bar.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> sendPasswordResetEmail(String email) async {
    isLoading(true);

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      appSnackbar(
        title: "Success",
        message: "sent successfully check your email",
        backgroundColor: ColorsManager.successColor,
      );
      Get.back();
    } on FirebaseAuthException catch (e) {
      appSnackbar(
        title: e.code,
        message: e.message!,
        backgroundColor: ColorsManager.errorColor,
      );
    } catch (e) {
      appSnackbar(
        title: "Failed",
        message: e.toString(),
        backgroundColor: ColorsManager.errorColor,
      );
    }
    isLoading(false);
    update(['send']);
  }
}
