import 'package:flutter/material.dart';
import 'package:lab_nerd/controllers/home/search_elements_controller.dart';
import 'package:lab_nerd/controllers/main_controller.dart';
import 'package:lab_nerd/views/components/app_text_form_field.dart';

class SearchAnElementField extends StatelessWidget {
  const SearchAnElementField({super.key, required this.controller});
  final SearchElementsController controller;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
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
    );
  }
}
