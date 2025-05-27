import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/sign_up_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/signup/widgets/already_have_account.dart';
import 'package:lab_nerd/views/auth/signup/widgets/sign_up_button.dart';
import 'package:lab_nerd/widgets/app_text_form_field.dart';

class TabletSignUpView extends StatelessWidget {
  TabletSignUpView({super.key});
  final controller = Get.find<SignUpController>();
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
              'SIGNUP',
              style: TextStyles.rem26Bold,
            ),
            AppTextFormField(
              helperText: 'Username',
              hintText: 'username',
              controller: controller.usernameController,
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 4,
            ),
            GetBuilder<SignUpController>(
              id: 'visibilty',
              builder: (_) => AppTextFormField(
                helperText: 'Password',
                prefixIconColor: Colors.black,
                controller: controller.passwordController,
                obscureText: controller.isVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.toggleVisibiltyPassword();
                  },
                  icon: Icon(
                    controller.isVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                hintText: 'password',
                textInputType: TextInputType.visiblePassword,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            AppTextFormField(
              helperText: 'Email',
              prefixIconColor: Colors.black,
              borderColor: Colors.black,
              focusedColor: Colors.black,
              hintText: 'email address',
              controller: controller.usernameController,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 40.h,
            ),
            SignUpButton(),
            SizedBox(
              height: 10.h,
            ),
            AlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}
