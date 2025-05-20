import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/forgot_password_controller.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/widgets/app_loading.dart';
import 'package:lab_nerd/widgets/default_button.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      id: 'send',
      builder: (controller) => DefaultButton(
        onPressed: onTap,
        colorButton: ColorsManager.greenWhite,
        width: 256.w,
        child: controller.isLoading.value
            ? const AppLoading()
            : Center(
                child: Text(
                  'Send',
                  style: TextStyles.rem14Bold.copyWith(color: Colors.black),
                ),
              ),
      ),
    );
  }
}
