import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/splash_controller.dart';
import 'package:lab_nerd/views/components/logo_without_eyes.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Stack(
        alignment: Alignment.center,
        children: [
          LogoWithoutEyes(),
          Positioned(
            bottom: 23,
            left: 24,
            child: SvgPicture.asset(
              controller.splashEyes[controller.currentIndex],
            ),
          ),
          Positioned(
            bottom: 23,
            right: 24,
            child: SvgPicture.asset(
              controller.splashEyes[controller.currentIndex],
            ),
          ),
        ],
      ),
    );
  }
}
