import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have account?",
          style: TextStyles.rem14Bold.copyWith(color: Colors.black),
        ),
        SizedBox(
          width: 14.w,
        ),
        GetBuilder<LoginController>(
          id: 'auth_bottom_sheet',
          builder: (controller) => InkWell(
            onTap: () => controller.toggleAuthBottomSheet(isLogin: true),
            child: Text(
              'Login',
              style: TextStyles.rem14Bold.copyWith(
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
