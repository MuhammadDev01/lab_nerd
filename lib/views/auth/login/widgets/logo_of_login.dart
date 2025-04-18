import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/login_controller.dart';
import 'package:lab_nerd/views/splash/widgets/eye_of_logo.dart';
import 'package:lab_nerd/views/splash/widgets/logo_without_eyes.dart';

class LogoOfLogin extends StatelessWidget {
  const LogoOfLogin({
    super.key,
  });
  final double sizeEye = 40;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        LogoWithoutEyes(),
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: GetBuilder<LoginController>(
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EyeOfLogo(
                    eyeAsset: controller.eyesList[controller.currentEyeIndex]),
                const SizedBox(
                  width: 100,
                ),
                EyeOfLogo(
                    eyeAsset: controller.eyesList[controller.currentEyeIndex]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
