import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/app_controller.dart';
import 'package:lab_nerd/utils/app_images.dart';
import 'package:lab_nerd/widgets/adding_key_widget.dart';
import '../../../widgets/home/bottom_navigation_bar_item.dart';

class HomeViewDesktop extends StatelessWidget {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: GetBuilder<Appcontroller>(
        builder: (controller) => Stack(
          children: [
            SvgPicture.asset(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              controller.backgroundHome,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: controller.pages[controller.currentIndex],
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.095,
                    color: controller.color,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: BottomNavigatorBarItem(
                              image: Assets.imagesSvgHome,
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
                            child: BottomNavigatorBarItem(
                              isActive: controller.currentIndex == 1,
                              onTap: () {
                                if (controller.currentIndex != 1) {
                                  controller.changeIndexNav(1);
                                }
                              },
                              image: Assets.imagesSvgPeriodicTableLogo,
                              firstLetter: 'P',
                              label: 'eriodic table ',
                            ),
                          ),
                          Expanded(
                            child: BottomNavigatorBarItem(
                              isActive: controller.currentIndex == 2,
                              onTap: () {
                                if (controller.currentIndex != 2) {
                                  controller.changeIndexNav(2);
                                }
                              },
                              image: Assets.imagesSvgExperiment,
                              firstLetter: 'E',
                              label: 'xperiment',
                            ),
                          ),
                          Expanded(
                            child: BottomNavigatorBarItem(
                              isActive: controller.currentIndex == 3,
                              onTap: () {
                                if (controller.currentIndex != 3) {
                                  controller.changeIndexNav(3);
                                }
                              },
                              image: Assets.imagesSvgExam,
                              firstLetter: 'E',
                              label: 'xams',
                            ),
                          ),
                          Expanded(
                            child: BottomNavigatorBarItem(
                              isActive: controller.currentIndex == 4,
                              onTap: () {
                                if (controller.currentIndex != 4) {
                                  controller.changeIndexNav(4);
                                }
                              },
                              image: Assets.imagesSvgSettings,
                              firstLetter: 'S',
                              label: 'ettings',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      actions: [
                        AddingKeyWidget(),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.key,
                  size: 30,
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
