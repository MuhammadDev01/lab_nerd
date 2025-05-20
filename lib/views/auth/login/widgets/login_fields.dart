import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/widgets/app_text_form_field.dart';

class LoginFields extends StatelessWidget {
  LoginFields({super.key});
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          helperText: 'Email',
          hintText: 'email address',
          onChange: (value) => controller.onChangeOnField(value),
          cursorAndPrefixIconColor: Colors.black,
          controller: controller.emailController,
          textInputType: TextInputType.emailAddress,
        ),
        GetBuilder<LoginController>(
          builder: (_) => AppTextFormField(
            helperText: 'Password',
            cursorAndPrefixIconColor: Colors.black,
            controller: controller.passwordController,
            obscureText: controller.isVisibilty,
            suffixIcon: IconButton(
              onPressed: () => controller.visibiltyPassword(),
              icon: Icon(controller.visibilityPasswordIcon),
            ),
            hintText: 'Password',
            textInputType: TextInputType.visiblePassword,
            validateMessage: 'enter password',
          ),
        ),
      ],
    );
  }
}
