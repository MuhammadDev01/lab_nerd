import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';
import 'package:lab_nerd/widgets/default_button.dart';
import 'package:lab_nerd/widgets/default_text_form_field.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Maincontroller controller = Get.find<Maincontroller>();
  String currentName = 'username';
  @override
  void initState() {
    nameController.text = controller.profileUser!.name;
    emailController.text = controller.profileUser!.email;
    currentName = controller.profileUser!.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset(
            Assets.imagesSvgBackground2,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
            child: GetBuilder<Maincontroller>(
              builder: (_) => Column(
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
                        'Change Username',
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
                          const SizedBox(
                            height: 25,
                          ),
                          DefaultTextFormField(
                            cursorAndPrefixIconColor: Colors.black87,
                            helperText: 'Username',
                            hintText: 'username',
                            controller: nameController,
                            textInputType: TextInputType.name,
                            textStyle: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          DefaultTextFormField(
                            helperText: 'Email',
                            hintText: 'email',
                            controller: emailController,
                            cursorAndPrefixIconColor: Colors.black87,
                            textInputType: TextInputType.emailAddress,
                            textStyle: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          DefaultButton(
                            width: 120,
                            colorButton: Colors.teal,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (nameController.text ==
                                    controller.profileUser!.name) {
                                  Get.snackbar(
                                    "Can't Update",
                                    'No changing in current name is happend',
                                    snackPosition: SnackPosition.TOP,
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red[900],
                                  );
                                } else {
                                  controller.changeLoading();
                                  // await controller.changeNameAndEmail(
                                  //   username: nameController.text,
                                  //   email: emailController.text,
                                  // );
                                  controller.changeLoading();
                                }
                              }
                            },
                            child: controller.isLoading
                                ? const LoadingWidget()
                                : const Text(
                                    'UPDATE',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
