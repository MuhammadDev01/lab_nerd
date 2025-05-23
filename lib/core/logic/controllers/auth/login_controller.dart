import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/widgets/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/repos/login_repo.dart';

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
    //  timer?.cancel();
    super.onClose();
  }

//**************ANIMATION**************\\
  RxInt currentEyeIndex = 0.obs;
  // Timer? timer;

  List<String> eyes = const [
    Assets.imagesSvgLookEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgHalfEye,
  ];
  _animationLogo() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 300));
      currentEyeIndex.value = (currentEyeIndex.value + 1) % eyes.length;
      return true;
    });
  }

//**************VISIBILITY**************\\
  bool isVisibilty = true;
  IconData visibilityPasswordIcon = Icons.visibility_off;
  toggleVisibiltyPassword() {
    isVisibilty = !isVisibilty;
    visibilityPasswordIcon =
        isVisibilty ? Icons.visibility_off : Icons.visibility;
    update(['visibility_password']);
  }

//**************TABLET**************\\
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  onPageChanged(int value) {
    currentPage.value = value;
    update();
  }

  goToSecondPageView() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

//**************LOGIN**************\\
  bool isLogin = true;
  toggleAuth({required bool isLogin}) {
    this.isLogin = isLogin;
    update(['login_or_sign_up']);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  onChangedOnField(String value) {
    emailController.text = value;
    update();
  }

  bool isLoading = false;
  toggleLoading() {
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
          await CacheHelper.authBox.put(kuserToken, user.uid);
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
              await CacheHelper.authBox.put(kuserToken, user.uid);
              Get.offAllNamed(Routes.mainView);
            },
          );
        });
      }
    }
    toggleLoading();
  }
}
