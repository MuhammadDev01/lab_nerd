import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/splash_controller.dart';
import 'package:lab_nerd/views/splash/widgets/logo_without_eyes.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  final double eyeSize = 40;

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
                SvgPicture.asset(
                  'assets/images/svg/${controller.splashEyes[controller.currentIndex]}',
                  height: eyeSize,
                ),
                const SizedBox(
                  width: 100,
                ),
                SvgPicture.asset(
                  'assets/images/svg/${controller.splashEyes[controller.currentIndex]}',
                  height: eyeSize,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
