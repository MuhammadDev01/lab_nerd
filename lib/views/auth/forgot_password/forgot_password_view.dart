import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/auth/forgot_password_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'widgets/forgot_password_appbar.dart';
import 'widgets/forgot_password_circle_avatar.dart';
import '../../components/app_text_form_field.dart';
import 'widgets/forgot_password_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration:
            BoxDecoration(gradient: ColorsManager.forgotpasswordgradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 36),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const ForgotPasswordAppbar(
                  nameView: 'Forgot Password',
                ),
                SizedBox(
                  height: 100,
                ),
                ForgotPasswordCircleAvatar(
                  icon: const Icon(
                    Icons.question_mark,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'please enter your Email Address To Receive a Verification Code',
                  textAlign: TextAlign.center,
                  style: TextStyles.rem14SemiBold,
                ),
                SizedBox(
                  height: 30,
                ),
                AppTextFormField(
                  helperText: 'Email',
                  width: 650,
                  controller: emailController,
                  hintText: 'email address',
                  textInputType: TextInputType.emailAddress,
                  validateMessage: 'please enter your email address',
                ),
                SizedBox(
                  height: 100,
                ),
                ForgotPasswordButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Get.find<ForgotPasswordController>()
                          .sendPasswordResetEmail(emailController.text.trim());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
