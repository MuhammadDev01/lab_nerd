import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Maincontroller>(
      builder: (controller) => Column(
        children: [
          controller.user!.displayName == null
              ? const LoadingWidget()
              : Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: ClipOval(
                        child: Image.asset(
                          Assets.imagesUserImageProfile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.user!.displayName ?? 'username',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 18,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          controller.user!.email ?? 'email@gmail.com',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 16,
                              ),
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
