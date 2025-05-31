import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundSvgImage extends StatelessWidget {
  final Widget child;
  const BackgroundSvgImage({
    super.key,
    required this.child,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          width: double.infinity,
          height: double.infinity,
          image,
          fit: BoxFit.fill,
        ),
        child,
      ],
    );
  }
}
