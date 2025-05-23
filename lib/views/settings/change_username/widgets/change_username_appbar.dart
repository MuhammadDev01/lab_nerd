import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class ChangeUsernameAppbar extends StatelessWidget {
  const ChangeUsernameAppbar({
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
          'Change Username',
          style: TextStyles.rem20Boldd.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
