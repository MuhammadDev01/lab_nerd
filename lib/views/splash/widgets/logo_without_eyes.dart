import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class LogoWithoutEyes extends StatelessWidget {
  const LogoWithoutEyes({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesSvgLogoWithoutEyes,
      height: 130,
    );
  }
}
