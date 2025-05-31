import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/app_snack_bar.dart';
import 'package:lab_nerd/controllers/settings_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/main/widgets/background_gradient.dart';
import 'package:lab_nerd/views/main/screens/settings/change_password/widgets/change_password_appbar.dart';
import 'package:lab_nerd/views/main/screens/settings/change_password/widgets/change_password_fields.dart';
import 'package:lab_nerd/views/components/app_loading.dart';
import 'package:lab_nerd/views/components/custom_app_button.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final SettingsController controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundGradient(
        gradient: Get.isDarkMode
            ? ColorsManager.darkHomeGradient
            : ColorsManager.lightHomeGradient,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          child: Column(
            spacing: 50.h,
            children: [
              ChangePasswordAppBar(),
              ChangePasswordFields(),
              Obx(
                () => CustomAppButton(
                  width: 100.w,
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      await changePassword(controller);
                    }
                  },
                  colorButton: Colors.teal,
                  child: controller.isLoading.value
                      ? AppLoading()
                      : Text(
                          'Update',
                          style: TextStyles.rem16SemiBold
                              .copyWith(color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> changePassword(SettingsController controller) async {
    {
      controller.newPasswordController.text ==
              controller.confirmPasswordController.text
          ? await controller.changeUserPassword(
              controller.currentPasswordController.text,
              controller.newPasswordController.text,
            )
          : appSnackbar(
              title: 'Error',
              message: "Password don't match",
              backgroundColor: ColorsManager.errorColor,
            );
    }
  }
}
