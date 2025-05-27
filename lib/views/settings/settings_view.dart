import 'package:flutter/material.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/views/settings/contact_us/about_us_button.dart';
import 'package:lab_nerd/views/settings/change_username/change_username_button.dart';
import 'package:lab_nerd/views/settings/change_password/change_password_button.dart';
import 'package:lab_nerd/views/settings/dark_mode/dark_mode_button.dart';
import 'package:lab_nerd/views/settings/logout/logout_button.dart';
import 'package:lab_nerd/views/settings/user_details/user_details.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              UserDetails(),
              appDivider(),
              DarkModeButton(),
              appDivider(),
              ChangeUsernameButton(),
              appDivider(),
              ChangePasswordButton(),
              appDivider(),
              LogoutButton(),
              appDivider(),
              ContactUsButton(),
            ],
          ),
        ),
      ),
    );
  }
}
