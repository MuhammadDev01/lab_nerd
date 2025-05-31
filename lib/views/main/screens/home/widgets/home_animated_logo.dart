import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/home/home_controller.dart';
import 'package:lab_nerd/views/components/logo_without_eyes.dart';

class HomeAnimatedLogo extends StatelessWidget {
  const HomeAnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final eyeHeight = 13.0;
    // final logoHeight = 40.0;
    final eyeSpacing = 30.0;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        LogoWithoutEyes(),
        GetBuilder<HomeController>(
          builder: (controller) => Padding(
            padding: EdgeInsets.only(top: 14),
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
