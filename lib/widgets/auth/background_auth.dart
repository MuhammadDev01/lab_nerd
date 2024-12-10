import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab_nerd/utils/app_images.dart';

class BackgroundAuth extends StatelessWidget {
  final Widget child;
  const BackgroundAuth({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          width: double.infinity,
          height: double.infinity,
          Assets.imagesSvgAuthBackground,
          fit: BoxFit.fill,
        ),
        child,
      ],
    );
  }
}
