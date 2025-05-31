import 'package:flutter/material.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/auth/signup/widgets/already_have_account.dart';
import 'package:lab_nerd/views/auth/signup/widgets/sign_up_button.dart';
import 'package:lab_nerd/views/auth/widgets/app_bar_auth_bottom_sheet.dart';
import 'package:lab_nerd/views/auth/signup/widgets/sign_up_fields.dart';

class SignUpBottomSheetBody extends StatelessWidget {
  const SignUpBottomSheetBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          const AppbarAuthBottomSheet(),
          Text(
            'SIGNUP',
            style: TextStyles.rem14SemiBold.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SignUpFields(),
          SignUpButton(),
          AlreadyHaveAccount(),
        ],
      ),
    );
  }
}
