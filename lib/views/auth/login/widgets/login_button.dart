import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/login/widgets/google_login.dart';
import 'package:lab_nerd/views/components/app_loading.dart';
import 'package:lab_nerd/views/components/custom_app_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => CustomAppButton(
        colorButton: ColorsManager.greenWhiteColor,
        onPressed: () async => await controller.login(),
        child: controller.isLoading
            ? const AppLoading()
            : controller.emailController.text.isEmpty
                ? GoogleLogin()
                : Text(
                    'Login',
                    style: TextStyles.rem14SemiBold,
                  ),
      ),
    );
  }
}
