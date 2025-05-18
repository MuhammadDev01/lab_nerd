import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class SearchElementItemBody extends StatefulWidget {
  const SearchElementItemBody({
    super.key,
  });

  @override
  State<SearchElementItemBody> createState() => _SearchElementItemBodyState();
}

class _SearchElementItemBodyState extends State<SearchElementItemBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationSearchController;
  late Animation<double> _searchAnimation;

  @override
  void initState() {
    _animationSearchController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
    _searchAnimation = CurvedAnimation(
        parent: _animationSearchController, curve: Curves.linear);
    super.initState();
  }

  @override
  void dispose() {
    _animationSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.imagesSearchAnElement,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
          child: AnimatedBuilder(
            animation: _searchAnimation,
            builder: (context, child) {
              double angle = _searchAnimation.value * 2 * 3.141592653589793;
              double radius = 45;

              return Transform.translate(
                offset: Offset(
                  radius * cos(angle),
                  radius * sin(angle),
                ),
                child: child,
              );
            },
            child: const Icon(
              Icons.search_rounded,
              size: 60,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
