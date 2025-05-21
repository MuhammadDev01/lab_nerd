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
    moveEyes();

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    timer?.cancel();
    super.onClose();
  }

//**************MOVE EYES**************\\
  RxInt currentEyeIndex = 0.obs;
  Timer? timer;

  List<String> eyesList = const [
    Assets.imagesSvgLookEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgHalfEye,
  ];
  moveEyes() {
    timer = Timer.periodic(
      const Duration(milliseconds: 250),
      (_) {
        if (currentEyeIndex < eyesList.length - 1) {
          currentEyeIndex.value++;
        } else {
          currentEyeIndex(0);
        }
      },
    );
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

//**For Tablet**\\
  final PageController pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  // changeIndexPage(int index) {
  //   currentPage = index;
  //   update();
  // }

  onPressedFloatingTabletButton() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
    currentPageIndex.value = 1;
    update();
  }

//**************LOGIN**************\\
  String kLogin = 'login';
  bool isLogin = true;
  toggleAuthBottomSheet({required bool isLogin}) {
    this.isLogin = isLogin;
    update(['auth_bottom_sheet']);
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
