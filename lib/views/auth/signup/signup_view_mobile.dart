import 'package:flutter/material.dart';
import '../login/widgets/logo_of_login.dart';
import '../login/widgets/background_auth.dart';
import 'widgets/signup_mobile_bottom_sheet.dart';

class SignupViewMobile extends StatefulWidget {
  const SignupViewMobile({
    super.key,
  });

  @override
  State<SignupViewMobile> createState() => _SignupViewMobileState();
}

class _SignupViewMobileState extends State<SignupViewMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BackgroundAuth(
        child: ListView(
          children: const [
            LogoOfLogin(),
            SignupMobileBottomSheet(),
          ],
        ),
      ),
    );
  }
}
