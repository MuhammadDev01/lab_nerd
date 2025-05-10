import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class ChangeUsernameEmailWidget extends StatelessWidget {
  const ChangeUsernameEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Maincontroller>(
      builder: (controller) => InkWell(
        onTap: () {
          Get.toNamed(Routes.editProfileView);
        },
        borderRadius: BorderRadius.circular(6),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange[900],
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "Change Username",
              style: TextStyles.rem20Boldd,
            ),
          ],
        ),
      ),
    );
  }
}
