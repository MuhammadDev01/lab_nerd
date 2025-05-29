import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/main_controller.dart';
import 'package:lab_nerd/views/main/widgets/custom_bottom_navigation_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Maincontroller>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          controller: controller,
        ),
        body: controller.views[controller.currentIndex],
      ),
    );
  }
}
