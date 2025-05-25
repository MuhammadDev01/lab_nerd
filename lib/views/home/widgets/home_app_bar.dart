import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/home/widgets/home_animated_logo.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  final double size = 24;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesSvgScience,
          height: MediaQuery.sizeOf(context).width > 600 ? size.h * 2 : size,
        ),
        SizedBox(
          width: 4.w,
        ),
        SvgPicture.asset(
          Assets.imagesSvgNerd,
          height: MediaQuery.sizeOf(context).width > 600 ? size.h * 2 : size,
        ),
        SizedBox(
          width: 6.w,
        ),
        HomeAnimatedLogo(),
      ],
    );
  }
}
