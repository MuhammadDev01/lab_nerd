import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoEye extends StatelessWidget {
  const LogoEye({
    super.key,
    required this.eyeAssets,
  });

  final String eyeAssets;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      eyeAssets,
      height: 40,
    );
  }
}
