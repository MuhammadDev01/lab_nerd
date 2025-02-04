import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/helper/cached_helper.dart';
import 'package:lab_nerd/logic/controllers/app_controller.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Appcontroller>(
      builder: (controller) => Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple[600],
              ),
              child: const Icon(
                Icons.dark_mode,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "DarkMode",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const Spacer(),
            Switch(
              activeColor: Colors.blue[700],
              activeTrackColor: Colors.grey,
              value: CachedHelper.getData(key: 'isDark'),
              onChanged: (value) {
                controller.changeThemeMode(CachedHelper.getData(key: 'isDark'));
                CachedHelper.getData(key: 'isDark')
                    ? Get.changeThemeMode(ThemeMode.dark)
                    : Get.changeThemeMode(ThemeMode.light);
              },
            ),
          ],
        ),
      ),
    );
  }
}
