import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class NotHaveAnAccount extends StatelessWidget {
  const NotHaveAnAccount({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyles.rem14SemiBold.copyWith(color: Colors.black),
        ),
        SizedBox(
          width: 14.w,
        ),
        GetBuilder<LoginController>(
          id: 'login_or_sign_up',
          builder: (controller) => InkWell(
            onTap: () => controller.toggleAuth(isLogin: false),
            child: Text(
              'Sign up',
              style: TextStyles.rem14SemiBold.copyWith(
                color: ColorsManager.authRedColor,
                decoration: TextDecoration.underline,
                decorationColor: ColorsManager.authRedColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
