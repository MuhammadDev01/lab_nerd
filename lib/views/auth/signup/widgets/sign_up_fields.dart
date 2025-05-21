import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/sign_up_controller.dart';
import 'package:lab_nerd/widgets/app_text_form_field.dart';

class SignUpFields extends StatelessWidget {
  SignUpFields({super.key});
  final controller = Get.find<SignUpController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        spacing: 10.h,
        children: [
          AppTextFormField(
            controller: controller.usernameController,
            helperText: 'Username',
            hintText: 'username',
            cursorAndPrefixIconColor: Colors.black,
            textInputType: TextInputType.name,
            validateMessage: 'username required',
          ),
          AppTextFormField(
            controller: controller.emailController,
            helperText: 'Email',
            hintText: 'email',
            textInputType: TextInputType.emailAddress,
            cursorAndPrefixIconColor: Colors.black,
            validateMessage: 'email required',
          ),
          GetBuilder<SignUpController>(
            id: 'visibilty',
            builder: (_) => AppTextFormField(
              controller: controller.passwordController,
              helperText: 'Password',
              obscureText: controller.isVisibilty,
              suffixIcon: IconButton(
                onPressed: () => controller.visibilty(),
                icon: Icon(controller.visibilityPassword),
              ),
              hintText: 'password',
              cursorAndPrefixIconColor: Colors.black,
              textInputType: TextInputType.visiblePassword,
              validateMessage: 'password required',
            ),
          ),
        ],
      ),
    );
  }
}
