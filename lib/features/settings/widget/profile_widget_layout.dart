import 'package:flutter/material.dart';
import 'package:lab_nerd/views/settings/widget/profile_widget.dart';
import 'package:lab_nerd/views/settings/widget/profile_widget_tablet.dart';
import 'package:lab_nerd/widgets/adaptive_layout.dart';

class ProfileWidgetLayout extends StatelessWidget {
  const ProfileWidgetLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const ProfileWidget(),
      tablet: (context) => const ProfileWidgetTablet(),
    );
  }
}
