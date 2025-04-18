import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrowbackWidget extends StatelessWidget {
  const ArrowbackWidget({
    super.key,
    this.size = 30,
    this.background = Colors.blueAccent,
    this.color = Colors.white,
  });
  final double size;
  final Color background;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: background,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
