import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/sign_up_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/widgets/app_loading.dart';
import 'package:lab_nerd/widgets/custom_app_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => CustomAppButton(
        onPressed: () async {
          if (controller.formKey.currentState!.validate()) {
            await controller.signUp();
          }
        },
        colorButton: ColorsManager.greenWhite,
        child: controller.isLoading
            ? const AppLoading()
            : Text(
                'SIGN UP',
                style: TextStyles.rem14SemiBold,
              ),
      ),
    );
  }
}
