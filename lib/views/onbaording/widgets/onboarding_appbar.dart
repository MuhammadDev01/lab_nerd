import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/widgets/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';

class OnboardingAppbar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
          onPressed: () async {
            await CacheHelper.authBox.put(kOnBoarding, true);
            Get.offAllNamed(Routes.authView);
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
