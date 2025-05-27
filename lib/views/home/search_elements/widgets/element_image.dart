import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElementImage extends StatelessWidget {
  const ElementImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        image,
        width: 50.w,
        height: 150.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
