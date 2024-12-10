import 'package:flutter/material.dart';

class AppbarBottomSheet extends StatelessWidget {
  const AppbarBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xffD2D4D8),
      ),
    );
  }
}
