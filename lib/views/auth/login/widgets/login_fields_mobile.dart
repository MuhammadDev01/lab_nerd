import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/login_controller.dart';
import 'package:lab_nerd/core/routes/app_router.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/login/widgets/default_login_button.dart';
import 'package:lab_nerd/views/auth/login/widgets/remember_me_and_forgot_password.dart';
import '../../../../widgets/app_bar_bottom_sheet.dart';
import '../../../../widgets/default_text_form_field.dart';
import 'google_login_button.dart';

class LoginFieldsMobile extends StatelessWidget {
  const LoginFieldsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const AppbarLoginBottomSheet(),
              const SizedBox(
                height: 16,
              ),
              Text(
                'LOGIN',
                style: TextStyles.rem20Boldd,
              ),
              DefaultTextFormField(
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
              DefaultTextFormField(
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
              ),
              RememberMeAndForgotPassword(),
              const SizedBox(
                height: 16,
              ),
              controller.emailController.text.isEmpty
                  ? const GoogleLoginButton()
                  : DefaultLoginButton(),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyles.rem14Bold,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.signupView);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyles.rem14Bold
                          .copyWith(color: const Color(0xffFD0505)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
