import 'package:flutter/material.dart';
import 'package:lab_nerd/controllers/main_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/main/widgets/bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.controller,
  });
  final Maincontroller controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          Expanded(
            child: CustomBottomNavigatorBarItem(
              image: Assets.imagesSvgHomeIcon,
              isActive: controller.currentIndex == 0,
              onTap: () {
                if (controller.currentIndex != 0) {
                  controller.changeIndexNav(0);
                }
              },
              firstLetter: 'H',
              label: 'ome',
            ),
          ),
          Expanded(
            child: CustomBottomNavigatorBarItem(
              isActive: controller.currentIndex == 1,
              onTap: () {
                if (controller.currentIndex != 1) {
                  controller.changeIndexNav(1);
                }
              },
              image: Assets.imagesSvgPeriodicTableIcon,
              firstLetter: 'P',
              label: 'eriodic table ',
            ),
          ),
          Expanded(
            child: CustomBottomNavigatorBarItem(
              isActive: controller.currentIndex == 2,
              onTap: () {
                if (controller.currentIndex != 2) {
                  controller.changeIndexNav(2);
                }
              },
              image: Assets.imagesSvgExamIcon,
              firstLetter: 'E',
              label: 'xam',
            ),
          ),
          Expanded(
            child: CustomBottomNavigatorBarItem(
              isActive: controller.currentIndex == 3,
              onTap: () {
                if (controller.currentIndex != 3) {
                  controller.changeIndexNav(3);
                }
              },
              image: Assets.imagesSvgSettingsIcon,
              firstLetter: 'S',
              label: 'ettings',
            ),
          ),
        ],
      ),
    );
  }
}
