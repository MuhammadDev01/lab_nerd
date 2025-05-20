import 'package:flutter/material.dart';
import 'package:lab_nerd/views/splash/widgets/science_nerd_word.dart';
import '../login/widgets/logo_of_auth.dart';
import '../login/widgets/background_auth.dart';
import 'widgets/bottom_sheet_signup_mobile.dart';

class SignupViewMobile extends StatelessWidget {
  const SignupViewMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BackgroundAuth(
        child: SafeArea(
          child: Column(
            children: [
              LogoOfAuth(),
              const SizedBox(
                height: 20,
              ),
              const ScienceNerdWord(),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              BottomSheetSignUpMobile(),
            ],
          ),
        ),
      ),
    );
  }
}
