import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/models/element_model.dart';

class SearchElementsController extends GetxController {
  bool isLoading = false;
  List<ElementModel> resultElements = [];
  TextEditingController searchController = TextEditingController();

  void searchElements(
    String query, {
    required List<ElementModel> allElements,
  }) {
    resultElements.clear();
    isLoading = true;
    update();
    resultElements = allElements.where((element) {
      final lowerQuery = query.toLowerCase();
      return element.name.toLowerCase().contains(lowerQuery) ||
          element.symbol.toLowerCase().contains(lowerQuery);
    }).toList();

    isLoading = false;
    update();
  }

  void resetResultList() {
    resultElements.clear();
    update();
  }
}
