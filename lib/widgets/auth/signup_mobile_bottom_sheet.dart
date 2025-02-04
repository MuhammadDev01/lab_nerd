import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/helper/cached_helper.dart';
import 'package:lab_nerd/logic/controllers/register_controller.dart';
import 'package:lab_nerd/utils/app_style.dart';
import 'package:lab_nerd/views/auth/forgot_password_view.dart';
import 'app_bar_bottom_sheet.dart';
import '../default_button.dart';
import '../default_text_form_field.dart';
import '../cancel_icon_button.dart';

class SignupMobileBottomSheet extends StatefulWidget {
  const SignupMobileBottomSheet({super.key});

  @override
  State<SignupMobileBottomSheet> createState() =>
      _SignupMobileBottomSheetState();
}

class _SignupMobileBottomSheetState extends State<SignupMobileBottomSheet> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const AppbarBottomSheet(),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'SIGNUP',
                    style: AppStyle.interF14w600.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  DefaultTextFormField(
                    helperText: 'Username',
                    controller: usernameController,
                    hintText: 'username',
                    cursorAndPrefixIconColor: Colors.black,
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextFormField(
                    helperText: 'Email',
                    controller: emailController,
                    hintText: 'email',
                    textInputType: TextInputType.emailAddress,
                    cursorAndPrefixIconColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<RegisterController>(
                    builder: (controller) => DefaultTextFormField(
                      helperText: 'Password',
                      controller: passwordController,
                      obscureText: controller.isVisibilty,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.visibilty();
                        },
                        icon: Icon(controller.visibilityPassword),
                      ),
                      hintText: 'password',
                      cursorAndPrefixIconColor: Colors.black,
                      textInputType: TextInputType.visiblePassword,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GetBuilder<RegisterController>(
                    builder: (controller) => DefaultButton(
                      onPressed: () async {
                        String username = usernameController.text.trim();
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        if (formKey.currentState!.validate()) {
                          controller.changeLoading();
                          await registerToHomeMethod(
                              controller, username, email, password);
                          controller.changeLoading();
                        }
                      },
                      colorButton: const Color(0xff5BE9A0),
                      child: controller.isLoading
                          ? const LoadingWidget()
                          : Text(
                              'Sign up',
                              style: AppStyle.interF14w600,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const CancelIconButton(),
      ],
    );
  }

  Future<void> registerToHomeMethod(RegisterController controller,
      String username, String email, String password) async {
    await controller
        .registerWithBackend(
      name: username,
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
              Get.snackbar(
                'Success Registeration',
                'Login to continue',
                colorText: Colors.white,
                backgroundColor: Colors.red[900],
              );
              Get.back();
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
