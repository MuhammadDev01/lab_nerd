import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/login_controller.dart';
import 'package:lab_nerd/core/routes/app_router.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/login/widgets/default_login_button.dart';
import 'package:lab_nerd/views/auth/login/widgets/remember_me_and_forgot_password.dart';
import '../../../../widgets/default_text_form_field.dart';
import 'google_login_button.dart';

class LoginFieldsTablet extends StatefulWidget {
  const LoginFieldsTablet({super.key});

  @override
  State<LoginFieldsTablet> createState() => _LoginFieldsTabletState();
}

class _LoginFieldsTabletState extends State<LoginFieldsTablet> {
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
                height: 80,
              ),
              Text(
                'LOGIN',
                style: TextStyles.rem14Bold.copyWith(fontSize: 24),
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
                  onPressed: () {
                    controller.visibiltyPassword();
                  },
                  icon: Icon(controller.visibilityPasswordIcon),
                ),
                hintText: 'password',
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

// class LoginButton extends StatelessWidget {
//   const LoginButton({
//     super.key,
//     required this.emailController,
//     required this.passwordController,
//     required this.formKey,
//   });

//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//   final GlobalKey<FormState> formKey;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LoginController>(
//       builder: (controller) => DefaultButton(
//         onPressed: () async {
//           //String email = emailController.text.trim();
//           //String password = passwordController.text.trim();
//           if (formKey.currentState!.validate()) {
//             controller.changeLoading();
//             // await controller
//             //     .loginWithFirebase(
//             //       email: email,
//             //       password: password,
//             //     )
//             //     .then((value) => controller.changeLoading());
//           }
//         },
//         colorButton: const Color(0xff5BE9A0),
//         child: controller.isLoading
//             ? const LoadingWidget()
//             : Text(
//                 'Login',
//                 style: TextStyles.rem14Bold.copyWith(
//                   fontSize: 18,
//                 ),
//               ),
//       ),
//     );
//   }
// }

// class GoogleButton extends StatelessWidget {
//   const GoogleButton({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LoginController>(
//       builder: (controller) => DefaultButton(
//         onPressed: () async {
//           controller.changeLoading();
//           await controller.loginWithGoogle();
//           controller.changeLoading();
//         },
//         colorButton: Colors.grey[300],
//         child: controller.isLoading
//             ? const LoadingWidget()
//             : const GoogleLoginButton(),
//       ),
//     );
//   }
// }
