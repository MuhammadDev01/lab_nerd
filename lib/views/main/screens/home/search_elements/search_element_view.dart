import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/app_divider.dart';
import 'package:lab_nerd/controllers/home/search_elements_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/main/screens/home/search_elements/widgets/element_builder.dart';
import 'package:lab_nerd/views/main/screens/home/search_elements/widgets/search_an_element_field.dart';
import 'package:lab_nerd/views/main/widgets/background_gradient.dart';

class SearchElementView extends StatelessWidget {
  const SearchElementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundGradient(
        gradient: Get.isDarkMode
            ? ColorsManager.darkHomeGradient
            : ColorsManager.lightHomeGradient,
        child: GetBuilder<SearchElementsController>(
          builder: (controller) => SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    title: Text(
                      "Search Element",
                      style: TextStyles.slacksideOnes30Bold,
                    ),
                  ),
                  SearchAnElementField(
                    controller: controller,
                  ),
                  if (controller.isLoading) const SizedBox(height: 15),
                  if (controller.isLoading) linearLoading(),
                  if (controller.resultElements.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => ElementBuilder(
                          element: controller.resultElements[index],
                        ),
                        separatorBuilder: (context, index) => appDivider(
                            color: Colors.black, height: 50, thickness: 2),
                        itemCount: controller.resultElements.length,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding linearLoading() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: LinearProgressIndicator(
        color: Colors.blue,
      ),
    );
  }
}
