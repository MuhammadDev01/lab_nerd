import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/main/widgets/background_gradient.dart';

class PeriodicTableView extends StatelessWidget {
  const PeriodicTableView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Maincontroller>(
      builder: (controller) => Stack(
        children: [
          BackgroundGradient(
            gradient: Get.isDarkMode
                ? ColorsManager.darkHomeGradient
                : ColorsManager.lightHomeGradient,
          ),
          InteractiveViewer(
            maxScale: 8,
            minScale: 1,
            child: SvgPicture.asset(
              controller.isEnglish
                  ? Assets.imagesSvgPeriodicTableLarge
                  : Assets.imagesSvgPeriodicTableAr,
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                child: Text(
                  controller.isEnglish ? 'EN' : 'AR',
                  style: TextStyles.rem20Boldd.copyWith(color: Colors.black),
                ),
                onPressed: () => controller.changeLang(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
