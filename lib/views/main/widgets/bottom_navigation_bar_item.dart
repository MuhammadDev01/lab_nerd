import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class CustomBottomNavigatorBarItem extends StatelessWidget {
  const CustomBottomNavigatorBarItem({
    super.key,
    required this.image,
    required this.onTap,
    this.scale = 3,
    required this.label,
    required this.firstLetter,
    this.isActive = false,
  });
  final String image;
  final String label;
  final String firstLetter;
  final void Function()? onTap;
  final double scale;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              )
            : const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              image,
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    firstLetter,
                    style: TextStyles.slacksideOnesF16.copyWith(
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyles.slacksideOnesF16.copyWith(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
