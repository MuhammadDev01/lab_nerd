import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cached_helper.dart';
import 'package:lab_nerd/views/auth/login/login_view_builder.dart';

class OnboardingAppbar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
          onPressed: () {
            CachedHelper.saveData(key: kOnBoarding, value: true).then((value) {
              if (value) {
                Get.off(
                  () => const LoginViewBuilder(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 500),
                );
              }
            });
          },
          child: const Text(
            'SKIP',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
