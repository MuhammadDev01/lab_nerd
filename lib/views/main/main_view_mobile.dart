import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/views/main/widgets/main_bottom_navigation_bar.dart';

class MainViewMobile extends StatelessWidget {
  const MainViewMobile({super.key});

  final double sizeIcons = 30;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Maincontroller>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: MainBottomNavigationBar(
          controller: controller,
        ),
        body: controller.views[controller.currentIndex],
      ),
    );
  }
}
