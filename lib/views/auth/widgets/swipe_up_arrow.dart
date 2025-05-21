import 'package:flutter/material.dart';

class SwipeUpArrow extends StatefulWidget {
  const SwipeUpArrow({super.key});

  @override
  State<SwipeUpArrow> createState() => _SwipeUpArrowState();
}

class _SwipeUpArrowState extends State<SwipeUpArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      _animationController = AnimationController.unbounded(vsync: this)
        ..repeat(min: -0.5, max: 1.5, period: const Duration(seconds: 1));
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, child) => ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            transform:
                _SlideGradientTransform(precent: _animationController.value),
            colors: const [
              Colors.white,
              Colors.white24,
              Colors.white,
            ]).createShader(bounds),
        child: child,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            heightFactor: .2,
            child: Icon(
              Icons.keyboard_arrow_up,
              size: 50,
              color: Colors.black,
            ),
          ),
          Align(
            heightFactor: .4,
            child: Icon(
              Icons.keyboard_arrow_up,
              size: 50,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class _SlideGradientTransform extends GradientTransform {
  final double precent;
  const _SlideGradientTransform({required this.precent});
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(0, -bounds.height * precent, 0);
  }
}
