import 'package:flutter/material.dart';
import 'package:lab_nerd/widgets/adaptive_layout.dart';
import 'package:lab_nerd/widgets/profile_widget_tablet.dart';
import 'package:lab_nerd/widgets/profile_widget.dart';

class ProfileWidgetLayout extends StatelessWidget {
  const ProfileWidgetLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const ProfileWidget(),
      desktop: (context) => const ProfileWidgetTablet(),
    );
  }
}
