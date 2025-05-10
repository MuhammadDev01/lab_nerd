import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/home_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  final double size = 20;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesSvgLab,
          height: size,
          width: size,
        ),
        const SizedBox(
          width: 10,
        ),
        SvgPicture.asset(
          Assets.imagesSvgNerd,
          height: size,
          width: size,
        ),
        const SizedBox(
          width: 10,
        ),
        AnimatedLogo(),
      ],
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            Assets.imagesSvgLogoWithoutEyes,
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  controller.eyesList[controller.currentEyeIndex],
                  width: 14,
                  height: 14,
                ),
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset(
                  controller.eyesList[controller.currentEyeIndex],
                  width: 14,
                  height: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
