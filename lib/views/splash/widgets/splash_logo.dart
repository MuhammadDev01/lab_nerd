import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/splash_controller.dart';
import 'package:lab_nerd/views/splash/widgets/logo_eye.dart';
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
        GetBuilder<SplashController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoEye(
                  eyeAssets: controller.splashEyes[controller.currentIndex],
                ),
                const SizedBox(
                  width: 100,
                ),
                LogoEye(
                  eyeAssets: controller.splashEyes[controller.currentIndex],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
