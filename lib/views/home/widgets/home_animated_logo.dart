import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/home_controller.dart';
import 'package:lab_nerd/views/splash/widgets/logo_without_eyes.dart';

class HomeAnimatedLogo extends StatelessWidget {
  const HomeAnimatedLogo({
    super.key,
  });
  final size = 14;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          LogoWithoutEyes(
            height: 40.h,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              children: [
                SvgPicture.asset(
                  controller.eyesList[controller.currentEyeIndex],
                  width: size.w,
                  height: size.h,
                ),
                SizedBox(
                  width: 30.w,
                ),
                SvgPicture.asset(
                  controller.eyesList[controller.currentEyeIndex],
                  width: size.w,
                  height: size.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
