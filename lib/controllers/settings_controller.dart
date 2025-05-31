import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/app_snack_bar.dart';
import 'package:lab_nerd/data/local_data.dart';
import 'package:lab_nerd/controllers/main_controller.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/constant.dart';

class SettingsController extends GetxController {
  //*************SIGN OUT**************\\
  Future<void> signoutFromApp() async {
    try {
      await FirebaseAuth.instance.signOut();
      await LocalData.authBox.delete(kuserToken);
      await LocalData.userBox.put(kDarkMode, false);
      if (Get.isDarkMode) await Get.find<Maincontroller>().changeTheme();
      Get.offAllNamed(Routes.authView);
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

  //*************CHANGE PASSWORD**************\\
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> changeUserPassword(
      String currentPassword, String newPassword) async {
    isLoading(true);
    if (mainController.user != null) {
      try {
        // 1️⃣ الحصول على بيانات تسجيل الدخول
        AuthCredential credential = EmailAuthProvider.credential(
          email: mainController.user!.email!,
          password: currentPassword, // إدخال كلمة المرور الحالية
        );

        // 2️⃣ إعادة مصادقة المستخدم باستخدام كلمة المرور الحالية
        await mainController.user!.reauthenticateWithCredential(credential);

        // 3️⃣ إذا كانت صحيحة، يتم تحديث كلمة المرور
        await mainController.user!.updatePassword(newPassword);

        Get.back();
        appSnackbar(
          title: 'Success',
          message: '',
          backgroundColor: ColorsManager.successColor,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          appSnackbar(
            title: 'Failed',
            message: 'Current password is incorrect',
            backgroundColor: ColorsManager.errorColor,
          );
        }
        if (e.code == 'weak-password') {
          appSnackbar(
            title: 'Failed',
            message: 'New password is weak',
            backgroundColor: ColorsManager.errorColor,
          );
        }
      } catch (e) {
        appSnackbar(
          title: 'Failed',
          message: e.toString(),
          backgroundColor: ColorsManager.errorColor,
        );
      }
    }
    update();
    isLoading(false);
  }
}
