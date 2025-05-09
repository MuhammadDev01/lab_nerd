import 'package:flutter/material.dart';
import 'package:lab_nerd/widgets/adaptive_layout.dart';
import 'package:lab_nerd/views/settings/widget/profile_widget_tablet.dart';
import 'package:lab_nerd/views/settings/widget/user_details.dart';

class UserDetailsLayout extends StatelessWidget {
  const UserDetailsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const UserDetails(),
      tablet: (context) => const ProfileWidgetTablet(),
    );
  }
}
