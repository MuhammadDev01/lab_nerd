import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';

class ProfileWidgetTablet extends StatelessWidget {
  const ProfileWidgetTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Maincontroller>(
      builder: (controller) => Column(
        children: [
          controller.userPofile.name == null
              ? const LoadingWidget()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user image profile.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.userPofile.name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 18,
                              ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          controller.userPofile.email ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 18,
                              ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                        iconSize: 28,
                        onPressed: () {
                          Get.toNamed(Routes.editProfileView);
                        },
                        icon: const Icon(
                          FontAwesomeIcons.penToSquare,
                        )),
                  ],
                ),
        ],
      ),
    );
  }
}
