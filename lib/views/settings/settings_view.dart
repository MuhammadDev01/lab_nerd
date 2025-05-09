import 'package:flutter/material.dart';
import 'package:lab_nerd/views/settings/widget/about_us_widget.dart';
import 'package:lab_nerd/views/settings/change_username_email_view.dart';
import 'package:lab_nerd/views/settings/widget/change_password_widget.dart';
import 'package:lab_nerd/views/settings/widget/dark_mode_widget.dart';
import 'package:lab_nerd/views/settings/widget/logout_widget.dart';
import 'package:lab_nerd/views/settings/widget/profile_widget_layout.dart';
import 'package:lab_nerd/views/settings/widget/share_app_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 10,
          children: [
            ProfileWidgetLayout(),
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
