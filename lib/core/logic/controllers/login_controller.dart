import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_nerd/constant.dart';
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
    super.onClose();
  }

  bool isVisibilty = true;
  IconData visibilityPasswordIcon = Icons.visibility_off;

  bool isLoading = false;
  bool check = false;
  int currentEyeIndex = 0;
  Timer? timer;

  String displayname = 'student';
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

//*Email and password
  var usersBox = Hive.box(kUsersBox);
  Future<void> loginWithEmailAndPassword() async {
    String emailAddress = emailController.text.trim();
    String password = passwordController.text.trim();
    await LoginRepo.loginWithEmail(email: emailAddress, password: password)
        .then((value) {
      if (value == 'Success') {
        appSnackbar(
          title: 'Success',
          message: 'Login Successfully',
          backgroundColor: ColorsManager.successColor,
        );
        usersBox.put(kuserToken, LoginRepo.userToken).then((_) {
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

//*Google
  Future<UserCredential> loginWithFirebaseGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> loginWithGoogle() async {
    try {
      await loginWithFirebaseGoogle();
      Get.offNamed(Routes.homeView);
    } catch (e) {
      appSnackbar(
        title: 'Failed',
        message: 'Login Failed Please Try Again',
        backgroundColor: ColorsManager.errorColor,
      );
      debugPrint('Error!!! : ${e.toString()}');
    }
  }
}
