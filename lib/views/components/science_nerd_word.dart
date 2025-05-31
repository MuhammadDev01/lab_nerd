import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/helper/spacing.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class ScienceNerdWord extends StatelessWidget {
  const ScienceNerdWord({
    super.key,
    this.height,
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesSvgScience,
        ),
        horizontalSpacing(10),
        SvgPicture.asset(
          Assets.imagesSvgNerd,
        ),
      ],
    );
  }
}
