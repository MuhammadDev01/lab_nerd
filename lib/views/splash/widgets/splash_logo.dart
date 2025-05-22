import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/splash_controller.dart';
import 'package:lab_nerd/views/splash/widgets/logo_without_eyes.dart';

class SplashLogo extends StatelessWidget {
  SplashLogo({
    super.key,
  });
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        LogoWithoutEyes(),
        Padding(
          padding: EdgeInsets.only(top: 36),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  controller.splashEyes[controller.currentIndex.value],
                  height: 34,
                ),
                SizedBox(
                  width: 78,
                ),
                SvgPicture.asset(
                  controller.splashEyes[controller.currentIndex.value],
                  height: 34,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
