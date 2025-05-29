import 'package:flutter/material.dart';
import 'package:lab_nerd/views/auth/auth_view_mobile.dart';
import 'package:lab_nerd/views/auth/auth_view_tablet.dart';
import '../components/adaptive_layout.dart';

class AuthViewBuilder extends StatelessWidget {
  const AuthViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const AuthViewMobile(),
      tablet: (context) => const AuthViewTablet(),
    );
  }
}
