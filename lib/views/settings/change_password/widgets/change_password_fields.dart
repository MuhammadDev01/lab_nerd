import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/settings_controller.dart';
import 'package:lab_nerd/widgets/app_text_form_field.dart';

class ChangePasswordFields extends StatefulWidget {
  const ChangePasswordFields({super.key});

  @override
  State<ChangePasswordFields> createState() => _ChangePasswordFieldsState();
}

class _ChangePasswordFieldsState extends State<ChangePasswordFields> {
  bool currentPasswordVisibility = true;
  bool newPasswordVisibility = true;
  bool confirmPasswordVisibility = true;
  final SettingsController controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          AppTextFormField(
            cursorAndPrefixIconColor: Colors.black54,
            helperText: 'Current password',
            controller: controller.currentPasswordController,
            hintText: 'current password',
            textInputType: TextInputType.visiblePassword,
            obscureText: currentPasswordVisibility,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  currentPasswordVisibility = !currentPasswordVisibility;
                });
              },
              icon: Icon(
                currentPasswordVisibility
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          AppTextFormField(
            cursorAndPrefixIconColor: Colors.black54,
            helperText: 'New password',
            controller: controller.newPasswordController,
            hintText: 'new password',
            textInputType: TextInputType.visiblePassword,
            obscureText: newPasswordVisibility,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  newPasswordVisibility = !newPasswordVisibility;
                });
              },
              icon: Icon(
                newPasswordVisibility ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          AppTextFormField(
            cursorAndPrefixIconColor: Colors.black,
            helperText: 'Confirm password',
            controller: controller.confirmPasswordController,
            hintText: 'confirm password',
            textInputType: TextInputType.visiblePassword,
            obscureText: confirmPasswordVisibility,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  confirmPasswordVisibility = !confirmPasswordVisibility;
                });
              },
              icon: Icon(
                confirmPasswordVisibility
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
