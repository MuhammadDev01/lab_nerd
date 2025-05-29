import 'package:flutter/material.dart';

class ChangeUsernameAppbar extends StatelessWidget {
  const ChangeUsernameAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        'Change Username',
      ),
      centerTitle: true,
    );
  }
}
