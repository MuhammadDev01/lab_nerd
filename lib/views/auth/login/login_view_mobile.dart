import 'package:flutter/material.dart';
import '../auth/animated_logo.dart';
import '../auth/background_auth.dart';
import '../auth/center_login_text.dart';
import '../../../../widgets/shimer_arrows.dart';
import '../auth/mobile_show_login_bottom_sheet.dart';

class LoginViewMobile extends StatelessWidget {
  const LoginViewMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: BackgroundAuth(
        child: Padding(
          padding: EdgeInsets.only(right: 16, left: 16, top: 16),
          child: Stack(
            children: [
              Column(
                children: [
                  AnimatedLogo(),
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CenterLoginText(),
                            ShimmerArrows(),
                          ],
                        ),
                        ShowLoginBottomSheet(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
