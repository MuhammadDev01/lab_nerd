import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton(
      {super.key, required this.child, required this.onTap});
  final Widget child;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 256,
        height: 50,
        decoration: BoxDecoration(
          gradient: ColorsManager.forgotpasswordgradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
