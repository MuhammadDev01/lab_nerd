import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/splash_controller.dart';
import 'package:lab_nerd/views/splash/widgets/eye_of_logo.dart';
import 'package:lab_nerd/views/splash/widgets/logo_without_eyes.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        LogoWithoutEyes(),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: GetBuilder<SplashController>(
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EyeOfLogo(
                  eyeAsset: controller.splashEyes[controller.currentIndex],
                ),
                const SizedBox(
                  width: 100,
                ),
                EyeOfLogo(
                  eyeAsset: controller.splashEyes[controller.currentIndex],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
