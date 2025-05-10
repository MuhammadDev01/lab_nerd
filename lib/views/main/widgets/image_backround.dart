import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    this.image,
    required this.child,
  });
  final String? image;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          image ?? Assets.imagesSvgBackgroundLight,
        ),
        child,
      ],
    );
  }
}
