import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/models/element_model.dart';
import 'package:lab_nerd/views/home/search_elements/details_element_view.dart';
import 'package:lab_nerd/views/home/search_elements/widgets/element_details.dart';
import 'package:lab_nerd/views/home/search_elements/widgets/element_image.dart';
import 'package:lab_nerd/views/home/search_elements/widgets/element_symbol_badge.dart';

class ElementBuilder extends StatelessWidget {
  const ElementBuilder({super.key, required this.element});
  final ElementModel element;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => DetailsElementView(element: element)),
      child: SizedBox(
        height: 150.h,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ElementImage(
                  image: element.image?.url ?? element.bohrModelImage,
                ),
                ElementSymbolBadge(element.symbol),
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            ElementDetails(element: element),
          ],
        ),
      ),
    );
  }
}
