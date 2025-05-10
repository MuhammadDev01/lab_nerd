import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';
import 'package:lab_nerd/widgets/default_button.dart';

class DefaultLoginButton extends StatelessWidget {
  const DefaultLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => DefaultButton(
        onPressed: () async {
          if (controller.formKey.currentState!.validate()) {
            controller.changeLoading();
            await controller.loginWithEmailAndPassword();
            controller.changeLoading();
          }
        },
        colorButton: const Color(0xff5BE9A0),
        child: controller.isLoading
            ? const LoadingWidget()
            : Text(
                'Login',
                style: TextStyles.rem14Bold,
              ),
      ),
    );
  }
}
