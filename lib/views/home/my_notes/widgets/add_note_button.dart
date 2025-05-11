import 'package:flutter/material.dart';

import 'constants.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key, this.onTap, required this.child});

  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: kPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
