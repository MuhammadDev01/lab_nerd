import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_bottom_sheet_body.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
      ),
      onVerticalDragUpdate: (details) {
        int sensitivity = 8;
        if (details.delta.dy > sensitivity) {
        } else if (details.delta.dy < -sensitivity) {
          Get.bottomSheet(
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: LoginBottomSheetBody(),
            ),
          );
        }
      },
    );
  }
}
