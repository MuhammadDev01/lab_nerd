import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/app_controller.dart';
import 'package:lab_nerd/widgets/about_us_widget.dart';
import 'package:lab_nerd/views/home/change_username_email_view.dart';
import 'package:lab_nerd/widgets/change_password_widget.dart';
import 'package:lab_nerd/widgets/dark_mode_widget.dart';
import 'package:lab_nerd/widgets/logout_widget.dart';
import 'package:lab_nerd/widgets/profile_widget_layout.dart';
import 'package:lab_nerd/widgets/share_app_widget.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var controller = Get.find<Appcontroller>();
  @override
  void initState() {
    controller.showProfileUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ProfileWidgetLayout(),
            SizedBox(
              height: 10,
            ),
            Divider(),
            DarkModeWidget(),
            Divider(),
            SizedBox(
              height: 10,
            ),
            ChangeUsernameEmailWidget(),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            ChangePasswordWidget(),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            LogOutWidget(),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            ShareAppWidget(),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            AboutUsWidget(),
          ],
        ),
      ),
    );
  }
}
