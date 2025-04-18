import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class NerdLabWord extends StatelessWidget {
  const NerdLabWord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesSvgLab),
            const SizedBox(
              width: 12,
            ),
            SvgPicture.asset(Assets.imagesSvgNerd),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SvgPicture.asset(Assets.imagesSvgChemistryForEveryone),
      ],
    );
  }
}
