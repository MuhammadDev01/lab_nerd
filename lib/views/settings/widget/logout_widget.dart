import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/app_controller.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Appcontroller>(
      builder: (controller) => InkWell(
        onTap: () {
          Get.defaultDialog(
            title: "Logout From App?",
            titleStyle: Theme.of(context).textTheme.displaySmall,
            middleText: 'Are you sure you need to logout',
            middleTextStyle: Theme.of(context).textTheme.displaySmall,
            radius: 10,
            textCancel: " No ",
            cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
            textConfirm: " YES ",
            confirmTextColor: Get.isDarkMode ? Colors.black : Colors.white,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              // controller.signoutFromApp();
            },
            buttonColor: Get.isDarkMode ? Colors.blueGrey : Colors.blue[600],
          );
        },
        borderRadius: BorderRadius.circular(6),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "Logout",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
