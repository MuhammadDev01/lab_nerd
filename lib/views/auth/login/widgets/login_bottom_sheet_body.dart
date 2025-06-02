import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/login/widgets/login_button.dart';
import 'package:lab_nerd/views/auth/login/widgets/login_fields.dart';
import 'package:lab_nerd/views/auth/login/widgets/not_have_an_account.dart';
import '../../widgets/app_bar_auth_bottom_sheet.dart';

class LoginBottomSheetBody extends StatelessWidget {
  LoginBottomSheetBody({super.key});
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const AppbarAuthBottomSheet(),
        Text(
          'LOGIN',
          style: TextStyles.rem16RegularGrey.copyWith(color: Colors.black),
        ),
        Column(
          children: [
            LoginFields(),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.forgotPasswordView),
                child: Text(
                  'Forgot Password?',
                  style: TextStyles.rem14SemiBold.copyWith(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
        LoginButton(),
        NotHaveAnAccount(),
      ],
    );
  }
}
