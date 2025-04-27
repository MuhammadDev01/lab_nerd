import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/main/widgets/image_backround.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'widgets/bottom_navigation_bar_item.dart';

class MainViewMobile extends StatelessWidget {
  const MainViewMobile({super.key});

  final double sizeIcons = 30;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Maincontroller>(
      builder: (controller) => Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: Container(
          height: MediaQuery.sizeOf(context).height * 0.09,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  label: 'xams',
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
        ),
      ),
    );

    // Scaffold(
    //   backgroundColor: Colors.white,
    //   resizeToAvoidBottomInset: false,
    //   body: GetBuilder<Maincontroller>(
    //     builder: (controller) => ImageBackround(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           Expanded(
    //             child: controller.views[controller.currentIndex],
    //           ),
    //           Container(
    //             height: MediaQuery.sizeOf(context).height * 0.09,
    //             color: controller.color,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 CustomBottomNavigatorBarItem(
    //                   image: Assets.imagesSvgHomeIcon,
    //                   isActive: controller.currentIndex == 0,
    //                   onTap: () {
    //                     if (controller.currentIndex != 0) {
    //                       controller.changeIndexNav(0);
    //                     }
    //                   },
    //                   firstLetter: 'H',
    //                   label: 'ome',
    //                 ),
    //                 CustomBottomNavigatorBarItem(
    //                   isActive: controller.currentIndex == 1,
    //                   onTap: () {
    //                     if (controller.currentIndex != 1) {
    //                       controller.changeIndexNav(1);
    //                     }
    //                   },
    //                   image: Assets.imagesSvgPeriodicTableIcon,
    //                   firstLetter: 'P',
    //                   label: 'eriodic table ',
    //                 ),
    //                 CustomBottomNavigatorBarItem(
    //                   isActive: controller.currentIndex == 2,
    //                   onTap: () {
    //                     if (controller.currentIndex != 2) {
    //                       controller.changeIndexNav(2);
    //                     }
    //                   },
    //                   image: Assets.imagesSvgExamIcon,
    //                   firstLetter: 'E',
    //                   label: 'xams',
    //                 ),
    //                 CustomBottomNavigatorBarItem(
    //                   isActive: controller.currentIndex == 3,
    //                   onTap: () {
    //                     if (controller.currentIndex != 3) {
    //                       controller.changeIndexNav(3);
    //                     }
    //                   },
    //                   image: Assets.imagesSvgSettingsIcon,
    //                   firstLetter: 'S',
    //                   label: 'ettings',
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
