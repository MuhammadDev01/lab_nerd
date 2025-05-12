import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/models/element_model.dart';

class ElementBuilder extends StatelessWidget {
  const ElementBuilder({super.key, required this.element});
  final ElementModel element;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(
        //   DetailsElementView(
        //     backdrop: element!.imageUrl!,
        //     poster: element!.imageUrl!,
        //     title: element!.nameElement!,
        //     description: element!.description!,
        //     atomicNumber: element!.atomicNumber!.toString(),
        //   ),
        //   transition: Transition.size,
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 150,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      element.image?.url ?? element.bohrModelImage,
                      width: 150.w,
                      height: 150.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.deepPurple,
                    ),
                    child: Text(
                      element.symbol,
                      style: TextStyles.rem16Bold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          element.name,
                          maxLines: 2,
                          style: TextStyles.rem20Boldd
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.teal,
                          ),
                          child: Text(
                            element.atomicNumber.toString(),
                            style: TextStyles.rem16Bold.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        element.image?.title ?? 'no information',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.rem16Bold.copyWith(
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
