import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cached_helper.dart';
import 'package:lab_nerd/core/logic/controllers/login_controller.dart';
import 'package:lab_nerd/core/routes/app_router.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';
import 'package:lab_nerd/views/home/home_layout.dart';
import '../../../../widgets/app_bar_bottom_sheet.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/default_text_form_field.dart';
import 'google_login_button.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const AppbarBottomSheet(),
            const SizedBox(
              height: 8,
            ),
            Text(
              'LOGIN',
              style: TextStyles.inter14Bold.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            DefaultTextFormField(
              helperText: 'Email',
              width: 650,
              hintText: 'email address',
              onChange: (value) {
                setState(() {
                  emailController.text = value;
                });
              },
              cursorAndPrefixIconColor: Colors.black,
              controller: emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 8,
            ),
            GetBuilder<LoginController>(
              builder: (controller) => DefaultTextFormField(
                helperText: 'Password',
                width: 650,
                cursorAndPrefixIconColor: Colors.black,
                controller: passwordController,
                obscureText: controller.isVisibilty,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.visibilty();
                  },
                  icon: Icon(controller.visibilityPassword),
                ),
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
              ),
            ),
            SizedBox(
              width: 650,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Remember me',
                        style: TextStyles.inter14Bold,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GetBuilder<LoginController>(
                        builder: (controller) => InkWell(
                          onTap: () {
                            controller.checkIcon();
                          },
                          child: Icon(
                            size: 15,
                            color: Colors.black,
                            controller.check
                                ? FontAwesomeIcons.circleCheck
                                : FontAwesomeIcons.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.forgotPasswordView);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.inter14Bold.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            emailController.text.isEmpty
                ? const GoogleButton()
                : LoginButton(
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyles.inter14Bold,
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
                    style: TextStyles.inter14Bold
                        .copyWith(color: const Color(0xffFD0505)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => DefaultButton(
        onPressed: () async {
          String email = emailController.text.trim();
          String password = passwordController.text.trim();
          if (formKey.currentState!.validate()) {
            controller.changeLoading();
            await loginToHomeMethod(controller, email, password);
            controller.changeLoading();
          }
        },
        colorButton: const Color(0xff5BE9A0),
        child: controller.isLoading
            ? const LoadingWidget()
            : Text(
                'Login',
                style: TextStyles.inter14Bold,
              ),
      ),
    );
  }

  Future<void> loginToHomeMethod(
      LoginController controller, String email, String password) async {
    await controller
        .loginWithBackend(
      email: email,
      password: password,
    )
        .then(
      (value) {
        try {
          if (controller.loginWithBackModel?.accessToken != null) {
            CachedHelper.saveData(
                    key: kOnLogging,
                    value: controller.loginWithBackModel!.accessToken)
                .then((value) {
              Get.off(
                const HomeLayout(),
                transition: Transition.fadeIn,
              );
            });
          } else if (controller.loginWithBackModel?.message != null) {
            Get.snackbar(
              'Error Found',
              controller.loginWithBackModel!.message!,
              colorText: Colors.white,
              backgroundColor: Colors.red[900],
            );
          }
        } catch (e) {
          Get.snackbar(
            'Error Found',
            e.toString(),
            colorText: Colors.white,
            backgroundColor: Colors.red[900],
          );
        }
      },
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => DefaultButton(
        onPressed: () async {
          controller.changeLoading();
          await controller.loginWithGoogle();
          controller.changeLoading();
        },
        colorButton: Colors.grey[300],
        child: controller.isLoading
            ? const LoadingWidget()
            : const LoginWithGoogleButton(),
      ),
    );
  }
}
