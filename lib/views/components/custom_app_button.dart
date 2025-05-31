import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.colorButton,
    this.width,
    this.height,
  });
  final void Function() onPressed;
  final Widget child;
  final Color? colorButton;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
          fixedSize: Size(
            width ?? 256,
            height ?? 50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      child: child,
    );
  }
}
