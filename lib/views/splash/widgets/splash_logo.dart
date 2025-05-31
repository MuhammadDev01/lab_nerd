import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/splash_controller.dart';
import 'package:lab_nerd/core/helper/spacing.dart';
import 'package:lab_nerd/views/components/logo_without_eyes.dart';

class SplashLogo extends StatelessWidget {
  SplashLogo({
    super.key,
  });
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        alignment: Alignment.center,
        children: [
          LogoWithoutEyes(),
          SvgPicture.asset(
            controller.splashEyes[controller.currentIndex.value],
            height: 30.h,
          ),
          SvgPicture.asset(
            controller.splashEyes[controller.currentIndex.value],
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FractionallySizedBox(
              //   widthFactor: 3,
              // ),
              //horizontalSpacing(87),
            ],
          ),
        ],
      ),
    );
  }
}
