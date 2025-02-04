import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/app_controller.dart';

class ShareAppWidget extends StatelessWidget {
  const ShareAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Appcontroller>(
      builder: (controller) => Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "Share our App",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
