import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/home_controller.dart';
import 'package:lab_nerd/views/splash/widgets/logo_without_eyes.dart';

class HomeAnimatedLogo extends StatelessWidget {
  const HomeAnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    final eyeHeight = isTablet ? 26.0 : 13.0;
    final logoHeight = isTablet ? 80.0 : 40.0;
    final eyeSpacing = isTablet ? 60.0 : 30.0;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        LogoWithoutEyes(
          height: logoHeight,
        ),
        GetBuilder<HomeController>(
          builder: (controller) => Padding(
            padding: EdgeInsets.only(top: isTablet ? 24 : 14),
            child: Row(
              children: [
                SvgPicture.asset(
                  controller.eyesList[controller.currentEyeIndex],
                  height: eyeHeight,
                ),
                SizedBox(
                  width: eyeSpacing,
                ),
                SvgPicture.asset(
                  controller.eyesList[controller.currentEyeIndex],
                  height: eyeHeight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
