import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class CenterLoginText extends StatelessWidget {
  const CenterLoginText({
    super.key,
    this.blackText = 'swipe up ',
  });
  final String blackText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              blackText,
              style: TextStyles.inter32Bold,
            ),
            Text(
              'to',
              style: TextStyles.inter32Regular
                  .copyWith(color: const Color(0xffC12D2B)),
            ),
          ],
        ),
        Text(
          'explore world of',
          style: TextStyles.inter32Regular
              .copyWith(color: const Color(0xffC12D2B)),
        ),
        Text(
          'chemistry',
          style: TextStyles.inter32Regular
              .copyWith(color: const Color(0xffC12D2B)),
        ),
      ],
    );
  }
}
