import 'package:flutter/material.dart';
import 'package:lab_nerd/views/splash/widgets/nerd_lab_word.dart';
import 'widgets/logo_of_login.dart';
import 'widgets/background_auth.dart';
import 'widgets/center_login_text.dart';
import 'widgets/swipe_up_arrow.dart';
import 'widgets/mobile_show_login_bottom_sheet.dart';

class LoginViewMobile extends StatelessWidget {
  const LoginViewMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: BackgroundAuth(
        child: Padding(
          padding: EdgeInsets.only(right: 16, left: 16, top: 16),
          child: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    LogoOfLogin(),
                    const SizedBox(
                      height: 20,
                    ),
                    const NerdLabWord(),
                    SizedBox(
                      height: 20,
                    ),
                    CenterLoginText(),
                    Expanded(child: SwipeUpArrow()),
                  ],
                ),
              ),
              ShowLoginBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }
}
