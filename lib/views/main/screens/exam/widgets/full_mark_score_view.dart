import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/components/constant.dart';

class FullMarkScoreView extends StatelessWidget {
  const FullMarkScoreView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events, size: 75.sp, color: Colors.amber),
            SizedBox(height: 20.h),
            Text(
              "🎉 Congratulations!   ",
              style: TextStyles.poppins32Bold.copyWith(letterSpacing: 2),
            ),
            SizedBox(height: 12.h),
            Text(
              "You scored",
              style: TextStyle(
                  fontFamily: fontPoppins,
                  fontSize: getResponsiveFontSize(fontSize: 36),
                  color: Colors.blueAccent,
                  letterSpacing: 2),
            ),
            const SizedBox(height: 12),
            Text(
              "100%",
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
