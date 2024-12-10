import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.colorButton,
    this.width = 256,
    
  });
  final void Function() onPressed;
  final Widget child;
  final Color? colorButton;
  final double width;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          fixedSize: Size(
            width,
            50,
           // MediaQuery.sizeOf(context).height * heightOfMediaQuery,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      child: child,
    );
  }
}
