import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesSvgGoogleIcon,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Login with Google',
          style: TextStyles.rem14SemiBold.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
