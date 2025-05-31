import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/login/widgets/login_button.dart';
import 'package:lab_nerd/views/auth/login/widgets/not_have_an_account.dart';
import '../../components/app_text_form_field.dart';

class TabletLoginView extends StatelessWidget {
  TabletLoginView({super.key});
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LOGIN',
              style: TextStyles.rem26Bold.copyWith(color: Colors.black),
            ),
            AppTextFormField(
              helperText: 'Email',
              hintText: 'email address',
              onChange: (value) => controller.onChangedOnField(value),
              prefixIconColor: Colors.black,
              controller: controller.emailController,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 8,
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
                hintText: 'password',
                textInputType: TextInputType.visiblePassword,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.forgotPasswordView),
                child: Text(
                  'Forgot Password?',
                  style: TextStyles.rem14SemiBold.copyWith(color: Colors.red),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            LoginButton(),
            SizedBox(
              height: 10,
            ),
            NotHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
