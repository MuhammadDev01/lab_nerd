import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground({
    super.key,
    this.backgroundHome = Assets.imagesSvgBackgroundLight,
    required this.child,
  });
  final String backgroundHome;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          backgroundHome,
        ),
        child,
      ],
    );
  }
}
