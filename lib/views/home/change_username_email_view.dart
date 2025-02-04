import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/app_controller.dart';
import 'package:lab_nerd/routes/app_router.dart';

class ChangeUsernameEmailWidget extends StatelessWidget {
  const ChangeUsernameEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Appcontroller>(
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
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
