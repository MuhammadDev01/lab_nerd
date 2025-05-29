import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/helper/global_helper.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/main/screens/home/widgets/home_animated_logo.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double imageSize = GlobalHelper.isTablet ? 48.h : 24.h;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesSvgScience,
          height: imageSize,
        ),
        SizedBox(
          width: 4.w,
        ),
        SvgPicture.asset(
          Assets.imagesSvgNerd,
          height: imageSize,
        ),
        SizedBox(
          width: 6.w,
        ),
        HomeAnimatedLogo(),
      ],
    );
  }
}
