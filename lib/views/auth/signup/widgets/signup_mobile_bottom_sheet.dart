import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/sign_up_controller.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/widgets/app_loading.dart';
import 'custom_app_bar_bottom_sheet.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/app_text_form_field.dart';
import 'cancel_icon_button.dart';

class SignupMobileBottomSheet extends StatelessWidget {
  const SignupMobileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.63,
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
                key: controller.formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomAppbarAuthBottomSheet(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'SIGNUP',
                      style: TextStyles.rem14Bold.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AppTextFormField(
                      controller: controller.usernameController,
                      helperText: 'Username',
                      hintText: 'username',
                      cursorAndPrefixIconColor: Colors.black,
                      textInputType: TextInputType.name,
                      validateMessage: 'username required',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextFormField(
                      controller: controller.emailController,
                      helperText: 'Email',
                      hintText: 'email',
                      textInputType: TextInputType.emailAddress,
                      cursorAndPrefixIconColor: Colors.black,
                      validateMessage: 'email required',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextFormField(
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
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultButton(
                      onPressed: () async {
                        if (controller.formKey.currentState!.validate()) {
                          controller.changeLoading();
                          await controller.signUpWithEmailAndPassword();
                          controller.changeLoading();
                        }
                      },
                      colorButton: ColorsManager.greenWhite,
                      child: controller.isLoading
                          ? const AppLoading()
                          : Text(
                              'SIGN UP',
                              style: TextStyles.rem14Bold.copyWith(
                                color: Colors.black,
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
      ),
    );
  }
}
