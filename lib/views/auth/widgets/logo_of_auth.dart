import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/views/splash/widgets/eye_of_logo.dart';
import 'package:lab_nerd/views/splash/widgets/logo_without_eyes.dart';

class LogoOfAuth extends StatelessWidget {
  LogoOfAuth({
    super.key,
  });
  final double sizeEye = 40;
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        LogoWithoutEyes(),
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EyeOfLogo(
                    eyeAsset:
                        controller.eyesList[controller.currentEyeIndex.value]),
                const SizedBox(
                  width: 100,
                ),
                EyeOfLogo(
                    eyeAsset:
                        controller.eyesList[controller.currentEyeIndex.value]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
