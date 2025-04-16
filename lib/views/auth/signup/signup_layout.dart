import 'package:flutter/material.dart';
import 'package:lab_nerd/views/auth/signup/signup_view_mobile.dart';
import 'package:lab_nerd/views/auth/signup/signup_view_tablet.dart';
import 'package:lab_nerd/widgets/adaptive_layout.dart';

class SignupLayout extends StatelessWidget {
  const SignupLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const SignupViewMobile(),
      desktop: (context) => const SignUpViewTablet(),
    );
  }
}
