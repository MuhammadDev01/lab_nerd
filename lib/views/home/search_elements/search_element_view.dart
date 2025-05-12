import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/core/logic/controllers/home/search_elements_controller.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/views/exams/widgets/elements_list_view.dart';
import 'package:lab_nerd/views/home/search_elements/widgets/search_an_element_field.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppBar(
                  centerTitle: 'Search Element',
                ),
                SizedBox(
                  height: 40.h,
                ),
                SearchAnElementField(
                  controller: controller,
                ),
                if (controller.isLoading) const SizedBox(height: 15),
                if (controller.isLoading) linearLoading(),
                if (controller.resultElements.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => ElementBuilder(
                        element: controller.resultElements[index],
                      ),
                      separatorBuilder: (context, index) => Container(
                        height: 1,
                        color: Colors.grey[300],
                      ),
                      itemCount: controller.resultElements.length,
                    ),
                  ),
              ],
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
