import 'package:flutter/material.dart';

class CustomForgotPasswordCircleAvatar extends StatelessWidget {
  const CustomForgotPasswordCircleAvatar({
    super.key,
    required this.insideCircleAvatar,
     this.radius=60,
  });
  final Widget insideCircleAvatar;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: const Color(0xff390b07).withOpacity(0.43),
        radius: radius,
        child: insideCircleAvatar,
      ),
    );
    
  }
}
