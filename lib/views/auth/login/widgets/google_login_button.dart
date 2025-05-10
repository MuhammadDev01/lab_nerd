import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';
import 'package:lab_nerd/views/auth/login/widgets/google_login_widget.dart';
import 'package:lab_nerd/widgets/default_button.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => DefaultButton(
          onPressed: () async {
            controller.changeLoading();
            await controller.loginWithGoogle();
            controller.changeLoading();
          },
          colorButton: Colors.grey[300],
          child: controller.isLoading
              ? const LoadingWidget()
              : const GoogleLoginWidget()),
    );
  }
}
