import 'package:flutter/material.dart';
import 'package:lab_nerd/views/auth/login_view_mobile.dart';
import 'package:lab_nerd/views/auth/login_view_tablet.dart';
import '../../../widgets/adaptive_layout.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const LoginViewMobile(),
      desktop: (context) => const LoginViewTablet(),
    );
  }
}
