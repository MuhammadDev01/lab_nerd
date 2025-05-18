import 'package:flutter/material.dart';
import 'package:lab_nerd/views/splash/widgets/science_nerd_word.dart';
import '../login/widgets/logo_of_login.dart';
import '../login/widgets/background_auth.dart';
import 'widgets/signup_mobile_bottom_sheet.dart';

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
            children: const [
              LogoOfLogin(),
              SizedBox(
                height: 20,
              ),
              ScienceNerdWord(),
              SizedBox(
                height: 20,
              ),
              Spacer(),
              SignupMobileBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }
}
