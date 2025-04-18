import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
  });

  final WidgetBuilder mobile, tablet;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return tablet(context);
        } else {
          return mobile(context);
        }
      },
    );
  }
}
