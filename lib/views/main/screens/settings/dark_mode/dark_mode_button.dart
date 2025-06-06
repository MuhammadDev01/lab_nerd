import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/utils/constant.dart';
import 'package:lab_nerd/data/local_data.dart';
import 'package:lab_nerd/controllers/main_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class DarkModeButton extends StatelessWidget {
  const DarkModeButton({super.key});

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
            style: TextStyles.rem16RegularGrey,
          ),
          const Spacer(),
          Switch(
            activeColor: Colors.blue[700],
            activeTrackColor: Colors.grey,
            value: LocalData.userBox.get(kDarkMode),
            onChanged: (_) => controller.changeTheme(),
          ),
        ],
      ),
    );
  }
}
