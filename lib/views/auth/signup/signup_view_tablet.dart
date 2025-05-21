import 'package:flutter/material.dart';
import 'package:lab_nerd/views/auth/forgot_password/widgets/forgot_password_back_button.dart';
import '../widgets/logo_of_auth.dart';
import '../widgets/background_auth.dart';
import 'widgets/signup_tablet_fields.dart';

class SignUpViewTablet extends StatelessWidget {
  const SignUpViewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BackgroundAuth(
        child: Stack(
          children: [
            Column(
              children: [
                LogoOfAuth(),
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
