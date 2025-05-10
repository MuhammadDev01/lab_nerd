import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class LogoWithoutEyes extends StatelessWidget {
  const LogoWithoutEyes({super.key, this.height, this.colorFilter});
  final double? height;
  final ColorFilter? colorFilter;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesSvgLogoWithoutEyes,
      height: height ?? 130,
      colorFilter: colorFilter,
    );
  }
}
