import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class ForgotPasswordCircleAvatar extends StatelessWidget {
  const ForgotPasswordCircleAvatar({
    super.key,
    required this.icon,
    this.radius = 60,
  });
  final Widget icon;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.black54,
        radius: radius,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(Assets.imagesSvgLock),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(28),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xCCD3B1B1),
                    const Color(0xffD9D9D9),
                  ]),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
