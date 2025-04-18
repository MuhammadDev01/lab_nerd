import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/utils/app_images.dart';

class LogoWithoutEyes extends StatelessWidget {
  const LogoWithoutEyes({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesSvgLogowithouteyes,
      height: 130,
    );
  }
}
