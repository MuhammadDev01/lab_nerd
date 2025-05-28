import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/global_helper.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/widgets/custom_app_button.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppButton(
      onPressed: () => Get.offNamed(Routes.mainView),
      colorButton: ColorsManager.greenWhite,
      width: GlobalHelper.isTablet ? 150.w : 100.w,
      height: GlobalHelper.isTablet ? 100.h : 50.h,
      child: Text(
        "Back Home",
        style: TextStyles.rem26Bold.copyWith(
          fontSize:
              getResponsiveFontSize(fontSize: GlobalHelper.isTablet ? 30 : 24),
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
