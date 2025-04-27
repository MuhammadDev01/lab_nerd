import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class HomeViewItem extends StatelessWidget {
  const HomeViewItem({
    super.key,
    required this.onTap,
    required this.animation,
    required this.title,
    this.image,
    this.child,
  });

  final void Function() onTap;
  final Animation<double> animation;
  final String title;
  final String? image;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white70,
        elevation: 25,
        child: Column(
          children: [
            Expanded(
              child: child ??
                  AnimatedBuilder(
                    animation: animation,
                    builder: (_, child) {
                      return Transform.translate(
                        offset: Offset(0, animation.value),
                        child: child,
                      );
                    },
                    child: Image.asset(
                      image ?? Assets.imagesNotFound,
                      width: 120,
                    ),
                  ),
            ),
            Divider(
              thickness: 2,
              height: 0,
              color: Colors.blueGrey,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: TextStyles.slacksideOnes20Bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
