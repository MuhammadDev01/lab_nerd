import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/utils/app_images.dart';
import 'package:lab_nerd/utils/app_style.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesSvgIcGoogle,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Login with Google',
          style: AppStyle.interF14w600,
        ),
      ],
    );
  }
}
