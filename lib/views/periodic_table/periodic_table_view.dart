import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/app_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class PeriodicTableView extends StatelessWidget {
  const PeriodicTableView({super.key});
  final bool isEnglish = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Appcontroller>(
      builder: (controller) => Stack(
        children: [
          InteractiveViewer(
            maxScale: 8,
            minScale: 1,
            child: SvgPicture.asset(
              controller.isEnglish
                  ? Get.isDarkMode
                      ? Assets.imagesSvgPeriodicTableLargeDark
                      : Assets.imagesSvgPeriodicTableLarge
                  : Get.isDarkMode
                      ? Assets.imagesSvgPeriodicTableArDark
                      : Assets.imagesSvgPeriodicTableAr,
              // colorFilter: const ColorFilter.mode(
              //   Colors.transparent,
              //   BlendMode.colorDodge,
              // ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              child: Text(
                controller.isEnglish ? 'AR' : 'EN',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              onPressed: () {
                controller.changeLang();
              },
            ),
          ),
        ],
      ),
    );
  }
}
