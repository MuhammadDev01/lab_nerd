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

//**************DEFAULT**************\\

  bool isVisibilty = true;
  IconData visibilityPasswordIcon = Icons.visibility_off;
  RxBool isLoading = false.obs;

  List<String> eyesList = const [
    Assets.imagesSvgLookEye,
    Assets.imagesSvgLookEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgRightEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgLeftEye,
    Assets.imagesSvgHalfEye,
  ];

  RxInt currentEyeIndex = 0.obs;
  Timer? timer;

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

  visibiltyPassword() {
    isVisibilty = !isVisibilty;
    visibilityPasswordIcon =
        isVisibilty ? Icons.visibility_off : Icons.visibility;
    update();
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

//******LOGIN******\\
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  onChangeOnField(String value) {
    emailController.text = value;
    update();
  }

//**Email and password
  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    isLoading(true);
    if (emailController.text.isEmpty) {
      //await loginWithGoogle();
    } else {
      if (formKey.currentState!.validate()) {
        final response = await LoginRepo.loginWithEmailAndPassword(
          email: email,
          password: password,
        );
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
      }
    }
    isLoading(false);
    update();
  }

//**Google
  // Future<void> loginWithGoogle() async {
  //   await LoginRepo.loginWithFirebaseGoogle().then((value) async {
  //     final userID = value.user?.uid;
  //     await CacheHelper.authBox.put(kuserToken, userID).then((_) {
  //       Get.offNamed(Routes.mainView);
  //     });
  //   }).catchError((error) {
  //     appSnackbar(
  //       title: 'Failed',
  //       message: 'Login Failed Please Try Again',
  //       backgroundColor: ColorsManager.errorColor,
  //     );
  //   });
  //   update();
  // }
}
