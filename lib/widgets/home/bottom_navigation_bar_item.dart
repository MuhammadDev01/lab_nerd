import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/app_controller.dart';
import 'package:lab_nerd/utils/app_style.dart';

class BottomNavigatorBarItem extends StatelessWidget {
  const BottomNavigatorBarItem({
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: GetBuilder<Appcontroller>(
        builder: (controller) => Container(
          decoration: isActive
              ? BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                )
              : const BoxDecoration(),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 60,
                child: SvgPicture.asset(
                  image,
                  colorFilter: ColorFilter.mode(
                      Get.isDarkMode
                          ? Theme.of(context).primaryColorLight
                          : Theme.of(context).primaryColorDark,
                      BlendMode.srcIn),

                  // color: Get.isDarkMode ? Colors.deepOrange[900] : Colors.black,
                  //scale: scale,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    firstLetter,
                    style: AppStyle.slacksideOnesF16.copyWith(
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    label,
                    style: AppStyle.slacksideOnesF16.copyWith(
                      color: Get.isDarkMode
                          ? Theme.of(context).primaryColorLight
                          : Theme.of(context).primaryColorDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
