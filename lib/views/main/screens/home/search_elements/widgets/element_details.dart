import 'package:flutter/material.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/models/element_model.dart';

class ElementDetails extends StatelessWidget {
  const ElementDetails({super.key, required this.element});
  final ElementModel element;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FittedBox(
                child: Text(
                  element.name,
                  style: TextStyles.rem20Bold.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.teal,
                ),
                child: Text(
                  element.atomicNumber.toString(),
                  style: TextStyles.rem16SemiBold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Expanded(
            child: Text(
              element.image?.title ?? 'no information',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.rem16SemiBold.copyWith(
                color: Colors.black45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
