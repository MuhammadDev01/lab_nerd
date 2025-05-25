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
      builder: (context, _) {
        if (MediaQuery.of(context).size.width < 600) {
          return mobile(context);
        } else {
          return tablet(context);
        }
      },
    );
  }
}
