import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/views/auth/login/widgets/login_bottom_sheet_body.dart';
import 'package:lab_nerd/views/auth/signup/widgets/sign_up_bottom_sheet_body.dart';

class AuthBottomSheetBody extends StatelessWidget {
  const AuthBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: GetBuilder<LoginController>(
        id: 'login_or_sign_up',
        builder: (controller) => controller.isLogin
            ? LoginBottomSheetBody()
            : SignUpBottomSheetBody(),
      ),
    );
  }
}
