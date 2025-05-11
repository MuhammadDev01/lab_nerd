import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class NoNotesYet extends StatelessWidget {
  const NoNotesYet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesEmptyNote,
            color: Colors.black54,
          ),
          Text(
            'No notes yet ....',
            style: TextStyles.rem20Boldd.copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
