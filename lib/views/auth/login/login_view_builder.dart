import 'package:flutter/material.dart';
import 'package:lab_nerd/views/auth/login/login_view_mobile.dart';
import 'package:lab_nerd/views/auth/login/login_view_tablet.dart';
import '../../../../widgets/adaptive_layout.dart';

class LoginViewBuilder extends StatelessWidget {
  const LoginViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const LoginViewMobile(),
      tablet: (context) => const LoginViewTablet(),
    );
  }
}
