import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class CongratulationsView extends StatelessWidget {
  const CongratulationsView({super.key, required this.percentage});
  final String percentage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.emoji_events, size: 100, color: Colors.amber),
            const SizedBox(height: 20),
            Text(
              "🎉 Congratulations!   ",
              style: TextStyles.poppins32Bold,
            ),
            SizedBox(height: 12.h),
            Text(
              "You scored",
              style: TextStyles.poppins32Bold.copyWith(
                fontSize: 20.sp,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "$percentage%",
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
