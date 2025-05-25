import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class ChangePasswordAppBar extends StatelessWidget {
  const ChangePasswordAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          'Change Paassword',
          style: TextStyles.rem20Bold.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
