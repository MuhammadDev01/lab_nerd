import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/app_snack_bar.dart';
import 'package:lab_nerd/data/local_data.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/data/repos/sign_up_repo.dart';
import 'package:lab_nerd/core/utils/constant.dart';

class SignUpController extends GetxController {
  final SignUpRepo _signUpRepo;

  SignUpController(this._signUpRepo);
  bool isVisible = true;
  IconData iconPassword = Icons.visibility_off;
  bool isLoading = false;

  void toggleVisibiltyPassword() {
    isVisible = !isVisible;
    iconPassword = isVisible ? Icons.visibility_off : Icons.visibility;
    update(['visibilty']);
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }

  void toggleLoading() {
    isLoading = !isLoading;
    update();
  }

//**SIGN UP**\\
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  Future<void> signUp() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    toggleLoading();
    await _signUpRepo
        .signUp(
      email: email,
      password: password,
      username: username,
    )
        .then((response) {
      response.fold(
          (errorMessage) => appSnackbar(
              title: "Failed",
              message: errorMessage,
              backgroundColor: ColorsManager.errorColor), (user) async {
        final userToken = FirebaseAuth.instance.currentUser?.uid;
        LocalData.authBox.put(kuserToken, userToken).then((_) {
          Get.offAllNamed(Routes.mainView);
        });
      });
    });

    toggleLoading();
  }
}
