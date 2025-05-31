import 'package:flutter/material.dart';

class ElementImage extends StatelessWidget {
  const ElementImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        image,
        width: 50,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
