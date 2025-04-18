import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/login_controller.dart';
import 'package:lab_nerd/utils/app_images.dart';
import 'package:lab_nerd/views/splash/widgets/logo_without_eyes.dart';
import 'package:lab_nerd/views/splash/widgets/nerd_lab_word.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
  });
  final double sizeEye = 40;
  final double betweenEyes = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              LogoWithoutEyes(),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<LoginController>(
                      builder: (controller) => SvgPicture.asset(
                        'assets/images/svg/${controller.eyesMovation[controller.currentIndexEyes]}',
                        height: sizeEye,
                      ),
                    ),
                    SizedBox(
                      width: betweenEyes,
                    ),
                    GetBuilder<LoginController>(
                      builder: (controller) => SvgPicture.asset(
                        'assets/images/svg/${controller.eyesMovation[controller.currentIndexEyes]}',
                        height: sizeEye,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          NerdLabWord(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SvgPicture.asset(
          //       Assets.imagesSvgLab,
          //       height: 50,
          //     ),
          //     const SizedBox(
          //       width: 13,
          //     ),
          //     SvgPicture.asset(
          //       Assets.imagesSvgNerd,
          //       height: 50,
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 6,
          // ),
          // SvgPicture.asset(
          //   Assets.imagesSvgChemistryforeveryone,
          //   height: 23,
          // ),
        ],
      ),
    );
  }
}
