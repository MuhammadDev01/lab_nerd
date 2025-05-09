import 'package:flutter/material.dart';
import 'package:lab_nerd/views/settings/widget/about_us_widget.dart';
import 'package:lab_nerd/views/settings/change_username_email_view.dart';
import 'package:lab_nerd/views/settings/widget/change_password_widget.dart';
import 'package:lab_nerd/views/settings/widget/dark_mode_widget.dart';
import 'package:lab_nerd/views/settings/widget/logout_widget.dart';
import 'package:lab_nerd/views/settings/widget/user_details_layout.dart';
import 'package:lab_nerd/views/settings/widget/share_app_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 10,
          children: [
            UserDetailsLayout(),
            Divider(),
            DarkModeWidget(),
            Divider(),
            ChangeUsernameEmailWidget(),
            Divider(),
            ChangePasswordWidget(),
            Divider(),
            LogOutWidget(),
            Divider(),
            ShareAppWidget(),
            Divider(),
            AboutUsWidget(),
          ],
        ),
      ),
    );
  }
}
