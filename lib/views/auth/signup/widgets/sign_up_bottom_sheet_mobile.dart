import 'package:flutter/material.dart';
import 'package:lab_nerd/views/auth/signup/widgets/sign_up_bottom_sheet_body.dart';
import 'cancel_icon_button.dart';

class SignUpBottomSheetMobile extends StatelessWidget {
  const SignUpBottomSheetMobile({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SignUpBottomSheetBody(),
        const CancelIconButton(),
      ],
    );
  }
}
