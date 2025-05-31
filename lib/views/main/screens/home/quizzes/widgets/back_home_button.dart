import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/components/custom_app_button.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppButton(
      onPressed: () => Get.offNamed(Routes.mainView),
      colorButton: ColorsManager.greenWhiteColor,
      width: 100,
      height: 50,
      child: Text(
        "Back Home",
        style: TextStyles.rem26Bold.copyWith(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
