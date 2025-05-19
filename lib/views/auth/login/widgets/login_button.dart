import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/login/widgets/google_login.dart';
import 'package:lab_nerd/widgets/app_loading.dart';
import 'package:lab_nerd/widgets/default_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => DefaultButton(
        colorButton: ColorsManager.greenWhite,
        onPressed: () async => await controller.login(),
        child: controller.isLoading.value
            ? const AppLoading()
            : controller.emailController.text.isEmpty
                ? GoogleLogin()
                : Text(
                    'Login',
                    style: TextStyles.rem14Bold.copyWith(color: Colors.black),
                  ),
      ),
    );
  }
}
