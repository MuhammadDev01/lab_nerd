import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/app_snack_bar.dart';
import 'package:lab_nerd/core/utils/constant.dart';
import 'package:lab_nerd/data/local_data.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/data/repos/login_repo.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    _animationLogo();

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

//**************ANIMATION**************\\
  RxInt currentEyeIndex = 0.obs;

  List<String> eyes = const [
    Assets.imagesSvgLookEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgHalfEye,
  ];
  void _animationLogo() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 300));
      currentEyeIndex.value = (currentEyeIndex.value + 1) % eyes.length;
      return true;
    });
  }

//**************VISIBILITY**************\\
  bool isVisibilty = true;
  IconData visibilityPasswordIcon = Icons.visibility_off;
  void toggleVisibiltyPassword() {
    isVisibilty = !isVisibilty;
    visibilityPasswordIcon =
        isVisibilty ? Icons.visibility_off : Icons.visibility;
    update(['visibility_password']);
  }

//**************LOGIN**************\\
  bool isLogin = true;
  void toggleAuth({required bool isLogin}) {
    this.isLogin = isLogin;
    update(['login_or_sign_up']);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void onChangedOnField(String value) {
    emailController.text = value;
    update();
  }

  bool isLoading = false;
  void toggleLoading() {
    isLoading = !isLoading;
    update();
  }

//**Email and password
  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    toggleLoading();
    if (emailController.text.isEmpty) {
      await LoginRepo.googleFirebase().then((response) {
        response.fold(
            (errorMessage) => appSnackbar(
                title: "Failed",
                message: errorMessage,
                backgroundColor: ColorsManager.errorColor), (user) async {
          await LocalData.authBox.put(kuserToken, user.uid);
          Get.offAllNamed(Routes.mainView);
        });
      });
    } else {
      if (formKey.currentState!.validate()) {
        await LoginRepo.emailAndPasswordFirebase(
          email: email,
          password: password,
        ).then((response) {
          response.fold(
            (errorMessage) {
              appSnackbar(
                  title: "Failed",
                  message: errorMessage,
                  backgroundColor: ColorsManager.errorColor);
            },
            (user) async {
              await LocalData.authBox.put(kuserToken, user.uid);
              Get.offAllNamed(Routes.mainView);
            },
          );
        });
      }
    }
    toggleLoading();
  }

//**************TABLET**************\\
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  void onPageChanged(int value) {
    currentPage.value = value;
    update();
  }

  void goToSecondPageView() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }
}
