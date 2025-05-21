import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class AuthViewCenterText extends StatelessWidget {
  const AuthViewCenterText({
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              blackText,
              style: TextStyles.poppins32Bold.copyWith(color: Colors.black),
            ),
            Text(
              'to',
              style: TextStyles.poppins32Regular
                  .copyWith(color: const Color(0xffC12D2B)),
            ),
          ],
        ),
        Text(
          'explore world of',
          style: TextStyles.poppins32RegularRED,
        ),
        Text(
          'chemistry',
          style: TextStyles.poppins32RegularRED,
        ),
      ],
    );
  }
}
