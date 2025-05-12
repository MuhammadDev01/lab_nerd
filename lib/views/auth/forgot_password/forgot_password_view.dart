import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/widgets/app_loading.dart';
import 'widgets/custom_forgot_password_appbar.dart';
import 'widgets/custom_forgot_password_circle_avatar.dart';
import '../../../widgets/app_text_form_field.dart';
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
        decoration:
            BoxDecoration(gradient: ColorsManager.forgotpasswordgradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 36),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomForgotPasswordAppbar(
                    nameView: 'Forgot Password',
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                  CustomForgotPasswordCircleAvatar(
                    insideCircleAvatar: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(Assets.imagesSvgLock),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: const EdgeInsets.all(28),
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0xCCD3B1B1),
                                const Color(0xffD9D9D9),
                              ]),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.question_mark,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    'please enter your Email Address To Receive a Verification Code',
                    textAlign: TextAlign.center,
                    style: TextStyles.rem14Bold,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppTextFormField(
                    helperText: 'Email',
                    width: 650,
                    controller: emailController,
                    hintText: 'email address',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 92,
                  ),
                  GetBuilder<LoginController>(
                    builder: (controller) => ForgotPasswordButton(
                      child: controller.isLoading
                          ? const AppLoading()
                          : Center(
                              child: Text(
                                'Send',
                                style: TextStyles.rem14Bold,
                              ),
                            ),
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          controller.changeLoading();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
