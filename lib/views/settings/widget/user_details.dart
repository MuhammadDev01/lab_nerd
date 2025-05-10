import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/widgets/app_loading.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Maincontroller>(
      builder: (controller) => Column(
        children: [
          controller.user!.displayName == null
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
                      width: 15.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.user!.displayName!.capitalize!,
                          style: TextStyles.rem16Bold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          controller.user!.email!,
                          style: TextStyles.rem16Bold
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
