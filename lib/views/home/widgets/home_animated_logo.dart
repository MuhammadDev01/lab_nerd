import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/home_controller.dart';
import 'package:lab_nerd/views/splash/widgets/logo_without_eyes.dart';

class HomeAnimatedLogo extends StatelessWidget {
  const HomeAnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        LogoWithoutEyes(
          height: 60.h,
        ),
        GetBuilder<HomeController>(
          builder: (controller) => Padding(
            padding: EdgeInsets.only(top: 18.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  controller.eyesList[controller.currentEyeIndex],
                  height: 18.h,
                ),
                SizedBox(width: 14.w),
                SvgPicture.asset(
                  controller.eyesList[controller.currentEyeIndex],
                  height: 18.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
