import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class LogoWithoutEyes extends StatelessWidget {
  const LogoWithoutEyes({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesSvgLogoWithoutEyes,
      height: height ?? 90.h,
    );
  }
}
