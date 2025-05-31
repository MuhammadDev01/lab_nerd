import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/main_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class CustomBottomNavigatorBarItem extends StatelessWidget {
  const CustomBottomNavigatorBarItem({
    super.key,
    required this.image,
    required this.onTap,
    this.scale = 3,
    required this.label,
    required this.firstLetter,
    this.isActive = false,
  });
  final String image;
  final String label;
  final String firstLetter;
  final void Function()? onTap;
  final double scale;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Maincontroller>(
      builder: (controller) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                image,
                colorFilter: ColorFilter.mode(
                  isActive
                      ? controller.colorBottomActive
                      : controller.colorDarkLight,
                  BlendMode.srcIn,
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      firstLetter,
                      style: TextStyles.slacksideOnes16.copyWith(
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      label,
                      style: TextStyles.slacksideOnes16.copyWith(
                        color: isActive
                            ? controller.colorBottomActive
                            : controller.colorDarkLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
