import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/views/splash/widgets/logo_without_eyes.dart';

class AuthLogoAnimated extends StatelessWidget {
  AuthLogoAnimated({
    super.key,
  });
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        LogoWithoutEyes(),
        Padding(
          padding: EdgeInsets.only(top: 36),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  controller.eyes[controller.currentEyeIndex.value],
                  height: 34,
                ),
                SizedBox(
                  width: 78,
                ),
                SvgPicture.asset(
                  controller.eyes[controller.currentEyeIndex.value],
                  height: 34,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
