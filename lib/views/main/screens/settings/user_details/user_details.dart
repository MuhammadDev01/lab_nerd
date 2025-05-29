import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/settings_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/components/app_loading.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) => Column(
        children: [
          controller.currentUsername == null
              ? const AppLoading()
              : Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50.r,
                      backgroundImage: AssetImage(
                        Assets.imagesUserImageProfile,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.currentUsername!.value,
                          style: TextStyles.rem16SemiBold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.currentEmail!.value,
                          style: TextStyles.rem16SemiBold
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
