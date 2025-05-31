import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/main/screens/home/widgets/home_animated_logo.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double imageSize = 24;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesSvgScience,
          height: imageSize,
        ),
        SizedBox(
          width: 4,
        ),
        SvgPicture.asset(
          Assets.imagesSvgNerd,
          height: imageSize,
        ),
        SizedBox(
          width: 6,
        ),
        HomeAnimatedLogo(),
      ],
    );
  }
}
