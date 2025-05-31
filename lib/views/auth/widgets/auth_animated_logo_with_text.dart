import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/views/auth/widgets/auth_logo_animated.dart';
import 'package:lab_nerd/views/components/science_nerd_word.dart';

class AuthAnimatedLogoWithText extends StatelessWidget {
  const AuthAnimatedLogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthLogoAnimated(),
        SizedBox(
          height: 20.h,
        ),
        const ScienceNerdWord(),
      ],
    );
  }
}
