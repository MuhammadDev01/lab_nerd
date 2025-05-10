import 'package:flutter/material.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/views/settings/widget/about_us_widget.dart';
import 'package:lab_nerd/views/settings/change_username_email_view.dart';
import 'package:lab_nerd/views/settings/widget/change_password_widget.dart';
import 'package:lab_nerd/views/settings/widget/dark_mode_widget.dart';
import 'package:lab_nerd/views/settings/widget/logout_button.dart';
import 'package:lab_nerd/views/settings/widget/user_details_layout.dart';
import 'package:lab_nerd/views/settings/widget/share_app_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            UserDetailsLayout(),
            appDivider(),
            DarkModeWidget(),
            appDivider(),
            ChangeUsernameEmailWidget(),
            appDivider(),
            ChangePasswordWidget(),
            appDivider(),
            LogoutButton(),
            appDivider(),
            ShareAppWidget(),
            appDivider(),
            AboutUsWidget(),
          ],
        ),
      ),
    );
  }
}
