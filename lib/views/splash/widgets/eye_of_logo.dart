import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EyeOfLogo extends StatelessWidget {
  const EyeOfLogo({
    super.key,
    required this.eyeAsset,
  });

  final String eyeAsset;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      eyeAsset,
      height: 40,
    );
  }
}
