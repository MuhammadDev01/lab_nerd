import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/app_controller.dart';
import 'package:lab_nerd/utils/app_images.dart';
import 'package:lab_nerd/views/auth/login/forgot_password_view.dart';
import 'package:lab_nerd/widgets/default_button.dart';
import 'package:lab_nerd/widgets/default_text_form_field.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();


  @override
  void dispose() {
    super.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset(
            Assets.background_2,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Change Paassword',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'REM',
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        GetBuilder<Appcontroller>(
                          builder: (visibilityController1) => DefaultTextFormField(
                            cursorAndPrefixIconColor: Colors.black54,
                            helperText: 'Current password',
                            controller: currentPasswordController,
                            hintText: 'current password',
                            textInputType: TextInputType.visiblePassword,
                            obscureText: visibilityController1.isVisibilty,
                            suffixIcon: IconButton(
                              onPressed: () {
                                visibilityController1.visibilty();
                              },
                              icon: Icon(
                                visibilityController1.visibilityPassword,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GetBuilder<Appcontroller>(
                          builder: (visibilityController2) => DefaultTextFormField(
                            cursorAndPrefixIconColor: Colors.black54,
                            helperText: 'New password',
                            controller: newPasswordController,
                            hintText: 'new password',
                            textInputType: TextInputType.visiblePassword,
                            obscureText: visibilityController2.isVisibilty,
                            suffixIcon: IconButton(
                              onPressed: () {
                                visibilityController2.visibilty();
                              },
                              icon: Icon(
                                visibilityController2.visibilityPassword,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GetBuilder<Appcontroller>(
                          builder: (visibilityController3) => DefaultTextFormField(
                            cursorAndPrefixIconColor: Colors.black54,
                            helperText: 'Confirm password',
                            controller: confirmPasswordController,
                            hintText: 'confirm password',
                            textInputType: TextInputType.visiblePassword,
                            obscureText: visibilityController3.isVisibilty,
                            suffixIcon: IconButton(
                              onPressed: () {
                                visibilityController3.visibilty();
                              },
                              icon: Icon(
                                visibilityController3.visibilityPassword,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        GetBuilder<Appcontroller>(
                          builder: (controller) => DefaultButton(
                            width: 110,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (newPasswordController.text ==
                                    confirmPasswordController.text) {
                                  controller.changeLoading();
                                  await controller.changePasswordUser(
                                    currentPassword:
                                        currentPasswordController.text,
                                    newPassword: newPasswordController.text,
                                    confirmPassword:
                                        confirmPasswordController.text,
                                  );
                                  controller.changeLoading();
                                } else {
                                  Get.snackbar(
                                    'Failed',
                                    'confirm password is not matched',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[900],
                                  );
                                }
                              }
                            },
                            colorButton: Colors.teal,
                            child: controller.isLoading
                                ? const LoadingWidget()
                                : const Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
