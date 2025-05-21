import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
    this.backgroundColor = Colors.teal,
    this.arrowColor = Colors.white,
  });
  final Color backgroundColor;
  final Color arrowColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        child: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 40,
          ),
        ),
      ),
    );
  }
}
