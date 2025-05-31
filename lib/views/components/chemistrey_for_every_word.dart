import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class ChemistreyForEveryWord extends StatelessWidget {
  const ChemistreyForEveryWord({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesSvgChemistryForEveryone,
    );
  }
}
