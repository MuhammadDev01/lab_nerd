import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/cached_helper.dart';
import 'package:lab_nerd/core/helper/dio_helper.dart';
import 'package:lab_nerd/core/helper/end_points.dart';
import 'package:lab_nerd/models/login_with_back_model.dart';
import 'package:lab_nerd/core/routes/app_router.dart';
import 'package:lab_nerd/core/utils/app_images.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    moveEyes();
    super.onInit();
  }

  bool isVisibilty = true;
  IconData visibilityPassword = Icons.visibility_off;

  bool isLoading = false;
  bool check = false;
  int currentEyeIndex = 0;
  Timer? timer;

  String displayname = 'student';
  List<String> eyesList = const [
    Assets.imagesSvgLook,
    Assets.imagesSvgLook,
    Assets.imagesSvgRighteye,
    Assets.imagesSvgRighteye,
    Assets.imagesSvgLefteye,
    Assets.imagesSvgLefteye,
    Assets.imagesSvgHalfeye,
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

  void visibilty() {
    isVisibilty = !isVisibilty;
    visibilityPassword = isVisibilty ? Icons.visibility_off : Icons.visibility;
    update();
  }

  void checkIcon() {
    check = !check;
    update();
  }

  void changeLoading() {
    isLoading = !isLoading;
    update();
  }

//**Login Pages in Tablet**\\
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

//login Firebase\\

  // Future<void> loginWithFirebase({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     await auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((value) async {
  //       await CachedHelper.saveData(key: 'uId', value: value.user!.uid);
  //     });

  //     update();
  //     Get.offNamed(Routes.homeView);
  //   } on FirebaseAuthException catch (e) {
  //     String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
  //     String message = '';
  //     if (e.code == 'user-not-found') {
  //       message = 'Email not found..please register and try again';
  //     } else if (e.code == 'wrong-password') {
  //       message = 'Incorrect password';
  //     } else {
  //       message = e.message.toString();
  //     }
  //     Get.snackbar(
  //       title,
  //       message,
  //       snackPosition: SnackPosition.TOP,
  //       colorText: Colors.white,
  //       backgroundColor: Colors.deepOrange[300],
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error Found',
  //       e.toString(),
  //       snackPosition: SnackPosition.TOP,
  //       colorText: Colors.white,
  //       backgroundColor: Colors.red,
  //     );
  //     debugPrint('Error : ${e.toString()}');
  //   }
  // }

  Response<dynamic>? response;
//login Backend
  LoginWithBackModel? loginWithBackModel;
  Future<void> loginWithBackend({
    required String email,
    required String password,
  }) async {
    await DioHelper.postData(
        url: '${CachedHelper.getData(key: 'url')}/api/$lOGIN',
        data: {
          'email': email,
          'password': password,
        }).then((value) {
      update();
      loginWithBackModel = LoginWithBackModel.fromJson(value.data);
    }).catchError((error) {
      update();

      Get.snackbar('Error', error.toString());
    });
  }

//google signIn
  Future<void> loginWithGoogle() async {
    update();
    Get.offNamed(Routes.homeView);
  }

//reset password
  // Future<void> resetPassword(String email) async {
  //   try {
  //     await auth.sendPasswordResetEmail(email: email).then((value) => update());
  //     Get.back();
  //     Get.snackbar(
  //       'Success!',
  //       'Check Your Email Now',
  //       snackPosition: SnackPosition.TOP,
  //       colorText: Colors.white,
  //       backgroundColor: Colors.teal,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
  //     String message = '';
  //     if (e.code == 'user-not-found') {
  //       message = 'This email is not registered';
  //     } else {
  //       message = e.message.toString();
  //     }
  //     Get.snackbar(
  //       title,
  //       message,
  //       snackPosition: SnackPosition.TOP,
  //       colorText: Colors.white,
  //       backgroundColor: Colors.orangeAccent,
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error Found',
  //       e.toString(),
  //       snackPosition: SnackPosition.TOP,
  //       colorText: Colors.white,
  //       backgroundColor: Colors.red,
  //     );
  //   }
  // }
}
