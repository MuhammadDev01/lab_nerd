import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/app_controller.dart';
import 'package:lab_nerd/models/element_model.dart';
import 'package:lab_nerd/views/home/details_element_view.dart';

class ElementsListView extends StatelessWidget {
  const ElementsListView({super.key, this.element});
  final ElementModel? element;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Appcontroller>(
      builder: (controller) => InkWell(
        onTap: () {
          Get.to(
            DetailsElementView(
              backdrop: element!.imageUrl!,
              poster: element!.imageUrl!,
              title: element!.nameElement!,
              description: element!.description!,
              atomicNumber: element!.atomicNumber!.toString(),
            ),
            transition: Transition.size,
          );
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
                        element!.imageUrl!,
                        width: 150,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.blueGrey,
                      child: Text(
                        element!.symbol!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
                            element!.nameElement!,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'REM',
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.teal,
                            ),
                            child: Text(
                              '${element!.atomicNumber}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          element!.description!,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'REM',
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
      ),
    );
  }
}
