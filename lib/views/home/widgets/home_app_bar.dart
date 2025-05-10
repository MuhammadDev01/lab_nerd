import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/home/widgets/home_animated_logo.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  final double size = 20;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesSvgLab,
          height: size.sp,
          width: size.sp,
        ),
        SizedBox(
          width: 10.w,
        ),
        SvgPicture.asset(
          Assets.imagesSvgNerd,
          height: size.sp,
          width: size.sp,
        ),
        SizedBox(
          width: 10.w,
        ),
        HomeAnimatedLogo(),
      ],
    );
  }
}
