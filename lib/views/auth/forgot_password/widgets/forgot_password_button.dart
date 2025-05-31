import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/auth/forgot_password_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/components/app_loading.dart';
import 'package:lab_nerd/views/components/custom_app_button.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      id: 'send',
      builder: (controller) => CustomAppButton(
        onPressed: onTap,
        colorButton: ColorsManager.greenWhiteColor,
        width: 256,
        child: controller.isLoading.value
            ? const AppLoading()
            : Center(
                child: Text(
                  'Send',
                  style: TextStyles.rem14SemiBold,
                ),
              ),
      ),
    );
  }
}
