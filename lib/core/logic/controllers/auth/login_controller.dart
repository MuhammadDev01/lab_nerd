import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/core/logic/controllers/splash_controller.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/repos/login_repo.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    Get.delete<SplashController>();

    moveEyes();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  bool isVisibilty = true;
  IconData visibilityPasswordIcon = Icons.visibility_off;

  bool isLoading = false;
  bool check = false;

  List<String> eyesList = const [
    Assets.imagesSvgLookEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgHalfEye,
  ];

  int currentEyeIndex = 0;
  Timer? timer;
  moveEyes() {
    timer = Timer.periodic(
      const Duration(milliseconds: 250),
      (_) {
        if (currentEyeIndex < eyesList.length - 1) {
          currentEyeIndex++;
          update();
        } else {
          currentEyeIndex = 0;
          update();
        }
      },
    );
  }

  visibiltyPassword() {
    isVisibilty = !isVisibilty;
    visibilityPasswordIcon =
        isVisibilty ? Icons.visibility_off : Icons.visibility;
    update();
  }

  void rememberMeCheck() {
    check = !check;
    update();
  }

  void changeLoading() {
    isLoading = !isLoading;
    update();
  }

//**For Tablet**\\
  final PageController pageController = PageController();
  int currentPage = 0;
  changeIndexPage(int index) {
    currentPage = index;
    update();
  }

  onPressedFloatingTabletButton() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
    currentPage = 1;
    update();
  }

//***SIGN IN ***\\
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void Function(String)? onChange(String? value) {
    emailController.text = value!;
    update();
    return null;
  }

//**Email and password
  Future<void> loginWithEmailAndPassword() async {
    String emailAddress = emailController.text.trim();
    String password = passwordController.text.trim();
    await LoginRepo.loginWithEmail(email: emailAddress, password: password)
        .then((value) {
      if (value == 'Success') {
        final userToken = FirebaseAuth.instance.currentUser?.uid;
        log('userToken : ${userToken.toString()}');
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
    update();
  }

//**Google
  Future<void> loginWithGoogle() async {
    await LoginRepo.loginWithFirebaseGoogle().then((value) async {
      final userID = value.user?.uid;
      await CacheHelper.authBox.put(kuserToken, userID).then((_) {
        Get.offNamed(Routes.mainView);
      });
    }).catchError((error) {
      appSnackbar(
        title: 'Failed',
        message: 'Login Failed Please Try Again',
        backgroundColor: ColorsManager.errorColor,
      );
    });
    update();
  }
}
