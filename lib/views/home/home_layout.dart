import 'package:flutter/material.dart';
import 'package:lab_nerd/views/home/home_view_mobile.dart';
import 'package:lab_nerd/views/home/home_view_tablet.dart';
import '../../../widgets/adaptive_layout.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const HomeViewMobile(),
      tablet: (context) => const HomeViewTablet(),
    );
  }
}
