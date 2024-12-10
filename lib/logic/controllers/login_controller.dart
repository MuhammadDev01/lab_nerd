import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/helper/cached_helper.dart';
import 'package:lab_nerd/helper/dio_helper.dart';
import 'package:lab_nerd/helper/end_points.dart';
import 'package:lab_nerd/models/login_with_back_model.dart';
import 'package:lab_nerd/routes/app_router.dart';

class LoginController extends GetxController {
  bool isVisibilty = true;
  IconData visibilityPassword = Icons.visibility_off;
  bool isLoading = false;
  bool check = false;

  int currentIndexEyes = 0;
  String displayname = 'student';
  List<String> eyesMovation = const [
    'look.svg',
    'look.svg',
    'right eye.svg',
    'right eye.svg',
    'left eye.svg',
    'left eye.svg',
    'half eye.svg',
  ];

  static Timer? timer;
  void moveEyes() {
    currentIndexEyes = 0;
    timer = Timer.periodic(
      const Duration(milliseconds: 250),
      (_) {
        if (currentIndexEyes < eyesMovation.length - 1) {
          currentIndexEyes++;
        } else {
          currentIndexEyes = 0;
        }
        update();
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

//login Firebase
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
