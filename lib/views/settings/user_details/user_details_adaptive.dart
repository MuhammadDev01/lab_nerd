import 'package:flutter/material.dart';
import 'package:lab_nerd/widgets/adaptive_layout.dart';
import 'package:lab_nerd/views/settings/user_details/user_details_tablet.dart';
import 'package:lab_nerd/views/settings/user_details/user_details_mobile.dart';

class UserDetailsBuilder extends StatelessWidget {
  const UserDetailsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const UserDetailsMobile(),
      tablet: (context) => const UserDetailsTablet(),
    );
  }
}
