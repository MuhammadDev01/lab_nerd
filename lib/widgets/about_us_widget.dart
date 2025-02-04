import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/app_controller.dart';
import 'package:lab_nerd/views/home/about_us_view.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Appcontroller>(
      builder: (controller) => InkWell(
        onTap: () {
          Get.to(() => const AboutUsView());
        },
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.brown,
                ),
                child: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "About Us",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
