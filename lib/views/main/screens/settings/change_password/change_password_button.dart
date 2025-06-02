import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/main/screens/settings/change_password/change_password_view.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ChangePasswordView());
      },
      borderRadius: BorderRadius.circular(6),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.teal[600],
            ),
            child: const Icon(
              Icons.password_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "Change Password",
            style: TextStyles.rem16RegularGrey,
          ),
        ],
      ),
    );
  }
}
