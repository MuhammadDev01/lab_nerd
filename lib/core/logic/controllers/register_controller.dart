import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/cached_helper.dart';
import 'package:lab_nerd/core/helper/dio_helper.dart';
import 'package:lab_nerd/core/helper/end_points.dart';
import 'package:lab_nerd/models/login_with_back_model.dart';

class RegisterController extends GetxController {
  bool isVisibilty = true;
  IconData visibilityPassword = Icons.visibility_off;
  bool isLoading = false;
  Timer? timer;
  int currentIndexEyes = 0;

  void visibilty() {
    isVisibilty = !isVisibilty;
    visibilityPassword = isVisibilty ? Icons.visibility_off : Icons.visibility;
    update();
  }

  void changeLoading() {
    isLoading = !isLoading;
    update();
  }

  LoginWithBackModel? loginWithBackModel;
  Future<void> registerWithBackend({
    required String name,
    required String email,
    required String password,
  }) async {
    await DioHelper.postData(
        url: '${CachedHelper.getData(key: 'url')}/api/$rEGISTER',
        data: {
          'name': name,
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
}
