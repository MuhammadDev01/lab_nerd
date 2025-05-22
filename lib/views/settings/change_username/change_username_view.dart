import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/logic/controllers/settings_controller.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/main/widgets/background_gradient.dart';
import 'package:lab_nerd/views/settings/change_username/widgets/change_username_appbar.dart';
import 'package:lab_nerd/widgets/app_loading.dart';
import 'package:lab_nerd/widgets/default_button.dart';
import 'package:lab_nerd/widgets/app_text_form_field.dart';

class ChangeUsernameView extends StatefulWidget {
  const ChangeUsernameView({super.key});

  @override
  State<ChangeUsernameView> createState() => _ChangeUsernameViewState();
}

class _ChangeUsernameViewState extends State<ChangeUsernameView> {
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<SettingsController>();
  @override
  void initState() {
    nameController.text = Maincontroller.userPofile.name!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundGradient(
        gradient: Get.isDarkMode
            ? ColorsManager.darkHomeGradient
            : ColorsManager.lightHomeGradient,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
          child: Column(
            children: [
              ChangeUsernameAppbar(),
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
                      AppTextFormField(
                        prefixIconColor: Colors.black87,
                        helperText: 'Username',
                        hintText: 'username',
                        controller: nameController,
                        textInputType: TextInputType.name,
                        validateMessage: 'Username Required',
                        textStyle:
                            TextStyles.rem16Bold.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Obx(
                        () => DefaultButton(
                          width: 120,
                          colorButton: Colors.teal,
                          onPressed: () => updateUserName(controller),
                          child: controller.isLoading.value
                              ? const AppLoading()
                              : const Text(
                                  'UPDATE',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
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
    );
  }

  updateUserName(SettingsController controller) async {
    if (formKey.currentState!.validate()) {
      await controller.updateUserName(nameController.text.trim()).then((value) {
        if (value == 'Success') Get.back();
      });
    }
  }
}
