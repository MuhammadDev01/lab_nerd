import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/login/widgets/login_button.dart';
import 'package:lab_nerd/views/auth/login/widgets/not_have_an_account.dart';
import 'package:lab_nerd/views/auth/login/widgets/remember_me_and_forgot_password.dart';
import '../../signup/widgets/custom_app_bar_bottom_sheet.dart';
import '../../../../widgets/app_text_form_field.dart';

class LoginFieldsMobile extends StatelessWidget {
  LoginFieldsMobile({super.key});
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const CustomAppbarAuthBottomSheet(),
            const SizedBox(
              height: 16,
            ),
            Text(
              'LOGIN',
              style: TextStyles.rem20Boldd.copyWith(color: Colors.black),
            ),
            AppTextFormField(
              helperText: 'Email',
              hintText: 'email address',
              onChange: (value) => controller.onChange(value),
              cursorAndPrefixIconColor: Colors.black,
              controller: controller.emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 8,
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
            RememberMeAndForgotPassword(),
            const SizedBox(
              height: 16,
            ),
            LoginButton(),
            const SizedBox(
              height: 6,
            ),
            NotHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
