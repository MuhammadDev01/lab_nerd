import 'package:flutter/material.dart';
import 'package:lab_nerd/views/main/main_view_mobile.dart';
import 'package:lab_nerd/views/main/main_view_tablet.dart';
import '../../../widgets/adaptive_layout.dart';

class MainViewAdaptive extends StatelessWidget {
  const MainViewAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: (context) => const MainViewMobile(),
      tablet: (context) => const MainViewTablet(),
    );
  }
}
