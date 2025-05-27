import 'package:flutter/material.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';

class ElementSymbolBadge extends StatelessWidget {
  const ElementSymbolBadge(
    this.symbol, {
    super.key,
  });

  final String symbol;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.deepPurple,
      ),
      child: Text(
        symbol,
        style: TextStyles.rem16SemiBold.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
