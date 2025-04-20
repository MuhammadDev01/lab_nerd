import 'package:flutter/material.dart';
import 'login_fields_mobile.dart';

class ShowLoginBottomSheet extends StatelessWidget {
  const ShowLoginBottomSheet({
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
          showBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.sizeOf(context).height * 0.63,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: const LoginFieldsMobile(),
              );
            },
          );
        }
      },
    );
  }
}
