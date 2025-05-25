import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class NormalScoreView extends StatelessWidget {
  const NormalScoreView({super.key, required this.percentage});
  final int percentage;

  String getEmojiForScore() {
    if (percentage < 50) {
      return "☹️";
    }
    return "🤓";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getEmojiForScore(),
              style: TextStyle(fontSize: 100),
            ),
            SizedBox(height: 20.h),
            Text(
              percentage < 50 ? "Fail" : "Success",
              style: TextStyles.rem26Bold.copyWith(
                fontSize: 50.sp,
                letterSpacing: 2,
                color: percentage < 50 ? Colors.red[900] : Colors.green,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "$percentage%",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: percentage < 50 ? Colors.red[900] : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
