import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class NotHaveAnAccount extends StatelessWidget {
  const NotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyles.rem14Bold.copyWith(color: Colors.black),
        ),
        SizedBox(
          width: 14.w,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.signupView),
          child: Text(
            'Sign up',
            style:
                TextStyles.rem14Bold.copyWith(color: const Color(0xffFD0505)),
          ),
        ),
      ],
    );
  }
}
