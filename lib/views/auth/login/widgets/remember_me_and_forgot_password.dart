import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return SizedBox(
      width: 650,
      child: Row(
        children: [
          Text(
            'Remember me',
            style: TextStyles.rem14Bold,
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () => controller.rememberMeCheck(),
            child: Icon(
              size: 15,
              color: Colors.black,
              controller.check
                  ? FontAwesomeIcons.circleCheck
                  : FontAwesomeIcons.circle,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () => Get.toNamed(Routes.forgotPasswordView),
            child: Text(
              'Forgot Password?',
              style: TextStyles.rem14Bold.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
