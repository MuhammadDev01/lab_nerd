import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/auth/login_controller.dart';
import 'package:lab_nerd/views/components/app_text_form_field.dart';

class LoginFields extends StatelessWidget {
  LoginFields({super.key});
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          AppTextFormField(
            helperText: 'Email',
            hintText: 'email address',
            onChange: (value) => controller.onChangedOnField(value),
            prefixIconColor: Colors.black,
            controller: controller.emailController,
            textInputType: TextInputType.emailAddress,
          ),
          GetBuilder<LoginController>(
            id: 'visibility_password',
            builder: (_) => AppTextFormField(
              helperText: 'Password',
              prefixIconColor: Colors.black,
              controller: controller.passwordController,
              obscureText: controller.isVisibilty,
              suffixIcon: IconButton(
                onPressed: () => controller.toggleVisibiltyPassword(),
                icon: Icon(controller.visibilityPasswordIcon),
              ),
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword,
              validateMessage: 'enter password',
            ),
          ),
        ],
      ),
    );
  }
}
