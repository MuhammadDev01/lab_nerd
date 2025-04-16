import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/animated_logo.dart';
import '../auth/background_auth.dart';
import '../auth/signup_tablet_fields.dart';

class SignUpViewTablet extends StatelessWidget {
  const SignUpViewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: BackgroundAuth(
        child: Stack(
          children: [
            Column(
              children: [
                AnimatedLogo(
                  logoHight: 190,
                  sizeEye: 70,
                  betweenEyes: 140,
                  trans: 60,
                  labNerdSize: 60,
                  wordSize: 26,
                ),
                Spacer(),
                SignupDesktopFields(),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
            BackArrow(),
          ],
        ),
      ),
    );
  }
}

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
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 40,
          ),
        ),
      ),
    );
  }
}
