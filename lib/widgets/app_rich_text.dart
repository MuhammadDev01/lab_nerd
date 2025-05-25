import 'package:flutter/material.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyles.rem16SemiBold.copyWith(
              color: Colors.teal,
            ),
          ),
          TextSpan(
            text: description,
            style: TextStyles.rem16SemiBold.copyWith(
              color: Colors.black,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
