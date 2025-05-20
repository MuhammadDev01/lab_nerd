import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/sign_up_controller.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/widgets/app_bar_auth_bottom_sheet.dart';
import 'package:lab_nerd/views/auth/signup/widgets/sign_up_fields.dart';
import 'package:lab_nerd/widgets/app_loading.dart';
import 'package:lab_nerd/widgets/default_button.dart';

class SignUpBottomSheetBody extends StatelessWidget {
  SignUpBottomSheetBody({
    super.key,
  });

  final controller = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const AppbarAuthBottomSheet(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'SIGNUP',
              style: TextStyles.rem14Bold.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SignUpFields(),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => DefaultButton(
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    await controller.signUp();
                  }
                },
                colorButton: ColorsManager.greenWhite,
                child: controller.isLoading.value
                    ? const AppLoading()
                    : Text(
                        'SIGN UP',
                        style: TextStyles.rem14Bold.copyWith(
                          color: Colors.black,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
