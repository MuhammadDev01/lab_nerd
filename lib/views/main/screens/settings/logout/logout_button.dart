import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/settings_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) => InkWell(
        onTap: () {
          Get.defaultDialog(
            title: "Logout From App",
            titleStyle: TextStyles.rem16RegularGrey,
            middleText: 'Are you sure you need to logout',
            middleTextStyle: TextStyles.rem16SemiBold,
            radius: 10,
            textCancel: " No ",
            cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
            textConfirm: " YES ",
            confirmTextColor: Colors.white,
            onConfirm: () async => await controller.signoutFromApp(),
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
              style: TextStyles.rem16RegularGrey,
            ),
          ],
        ),
      ),
    );
  }
}
