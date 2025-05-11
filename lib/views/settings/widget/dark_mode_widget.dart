import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Maincontroller>(
      builder: (controller) => Row(
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
            "Dark mode",
            style: TextStyles.rem20Boldd,
          ),
          const Spacer(),
          Switch(
            activeColor: Colors.blue[700],
            activeTrackColor: Colors.grey,
            //!!Todo
            value: CacheHelper.userBox.get(kDarkMode) ?? false,
            onChanged: (_) => controller.switchDarkMode(),
          ),
        ],
      ),
    );
  }
}
