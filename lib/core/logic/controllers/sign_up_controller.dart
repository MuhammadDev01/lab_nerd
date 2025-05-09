import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/repos/sign_up_repo.dart';

class SignUpController extends GetxController {
  bool isVisibilty = true;
  IconData visibilityPassword = Icons.visibility_off;
  bool isLoading = false;

  void visibilty() {
    isVisibilty = !isVisibilty;
    visibilityPassword = isVisibilty ? Icons.visibility_off : Icons.visibility;
    update();
  }

  void changeLoading() {
    isLoading = !isLoading;
    update();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }

//**SIGN UP**\\
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  Future<void> signUpWithEmailAndPassword() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    await SignUpRepo.signUp(
            email: email, password: password, username: username)
        .then((value) {
      if (value == 'Success') {
        final userToken = FirebaseAuth.instance.currentUser?.uid;
        CacheHelper.authBox.put(kuserToken, userToken).then((_) {
          Get.offNamed(Routes.mainView);
        });
      } else {
        appSnackbar(
          title: 'Failed',
          message: value,
          backgroundColor: ColorsManager.errorColor,
        );
      }
    });
  }
}
