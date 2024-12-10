import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/login_controller.dart';
import 'package:lab_nerd/utils/app_images.dart';
import 'package:lab_nerd/widgets/adding_key_widget.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    this.logoWidth = 266,
    this.logoHight = 150,
    this.sizeEye = 50,
    this.betweenEyes = 111,
    this.trans = 50,
    this.labNerdSize = 50,
    this.wordSize = 23,
  });
  final double logoWidth; // = 266;
  final double logoHight; // = 150;
  final double sizeEye; // = 50;
  final double betweenEyes;
  final double trans;
  final double labNerdSize;
  final double wordSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SvgPicture.asset(
                Assets.imagesSvgLogowithouteyes,
                width: logoWidth,
                height: logoHight,
              ),
              Padding(
                padding: EdgeInsets.only(top: trans),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<LoginController>(
                      builder: (controller) => SvgPicture.asset(
                        'assets/images/svg/${controller.eyesMovation[controller.currentIndexEyes]}',
                        width: sizeEye,
                        height: sizeEye,
                      ),
                    ),
                    SizedBox(
                      width: betweenEyes,
                    ),
                    GetBuilder<LoginController>(
                      builder: (controller) => SvgPicture.asset(
                        'assets/images/svg/${controller.eyesMovation[controller.currentIndexEyes]}',
                        width: sizeEye,
                        height: sizeEye,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      actions: [
                        AddingKeyWidget(),
                      ],
                    ),
                  );
                },
                child: SvgPicture.asset(
                  Assets.imagesSvgLab,
                  height: labNerdSize,
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              SvgPicture.asset(
                Assets.imagesSvgNerd,
                height: labNerdSize,
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          SvgPicture.asset(
            Assets.imagesSvgChemistryforeveryone,
            height: wordSize,
          ),
        ],
      ),
    );
  }
}
