import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab_nerd/core/logic/controllers/home/search_elements_controller.dart';
import 'package:lab_nerd/core/logic/controllers/main_controller.dart';
import 'package:lab_nerd/widgets/app_text_form_field.dart';

class SearchAnElementField extends StatelessWidget {
  const SearchAnElementField({super.key, required this.controller});
  final SearchElementsController controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.95, -2),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: AppTextFormField(
            controller: controller.searchController,
            helperText: 'Search An Element',
            prefixIcon: const Icon(Icons.search, color: Colors.black),
            textInputType: TextInputType.text,
            hintText: 'Type name element...',
            onChange: (String query) {
              if (controller.searchController.text.isNotEmpty) {
                controller.searchElements(
                  query,
                  allElements: Maincontroller.elementsList,
                );
              } else {
                controller.resetResultList();
              }
            },
            onSubmitted: (String query) {
              if (controller.searchController.text.isNotEmpty) {
                controller.searchElements(query,
                    allElements: Maincontroller.elementsList);
              } else {
                controller.resetResultList();
              }
            },
          ),
        ),
        IconButton(
          onPressed: () {
            // controller.getSearchOfElements(
            //   nameElement: searchController.text,
            //   sortType: 'asc',
            // );
          },
          color: Colors.black,
          icon: const Icon(FontAwesomeIcons.arrowDownAZ),
        )
      ],
    );
  }
}
