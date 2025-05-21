import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/views/auth/widgets/auth_bottom_sheet_body.dart';

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({
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
              height: 450.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: AuthBottomSheetBody(),
            ),
            isScrollControlled: true,
          );
        }
      },
    );
  }
}
