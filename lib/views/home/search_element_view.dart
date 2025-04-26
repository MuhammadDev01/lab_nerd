import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/app_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/exams/widgets/elements_list_view.dart';
import 'package:lab_nerd/widgets/default_text_form_field.dart';

class SearchElementView extends StatefulWidget {
  const SearchElementView({super.key});

  @override
  State<SearchElementView> createState() => _SearchElementViewState();
}

class _SearchElementViewState extends State<SearchElementView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();
  bool ascIcon = true;
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            Assets.imagesSvgBackground2,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Form(
            key: formKey,
            child: GetBuilder<Appcontroller>(
              builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  IconButton(
                    padding: const EdgeInsets.only(left: 5),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    alignment: const Alignment(0.95, -2),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: DefaultTextFormField(
                          controller: searchController,
                          cursorAndPrefixIconColor: Colors.black,
                          helperText: 'Search An Element',
                          prefixIcon: const Icon(Icons.search),
                          textInputType: TextInputType.text,
                          hintText: 'type name element...',
                          onSubmitted: (String text) async {
                            if (formKey.currentState!.validate()) {
                              // controller.changeLoading();
                              // await controller.getSearchOfElements(
                              //   nameElement: searchController.text,
                              //   sortType: 'asc',
                              // );
                              // controller.changeLoading();
                            }
                          },
                        ),
                      ),
                      ascIcon
                          ? IconButton(
                              onPressed: () {
                                // controller.getSearchOfElements(
                                //   nameElement: searchController.text,
                                //   sortType: 'desc',
                                // );
                                ascIcon = false;
                              },
                              color: Colors.black,
                              icon: const Icon(FontAwesomeIcons.arrowUpAZ),
                            )
                          : IconButton(
                              onPressed: () {
                                // controller.getSearchOfElements(
                                //   nameElement: searchController.text,
                                //   sortType: 'asc',
                                // );
                                ascIcon = true;
                              },
                              color: Colors.black,
                              icon: const Icon(FontAwesomeIcons.arrowDownAZ),
                            )
                    ],
                  ),
                  if (controller.isLoading) const SizedBox(height: 15),
                  if (controller.isLoading)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: LinearProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  if (controller.elementsList.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => ElementsListView(
                          element: controller.elementsList[index],
                        ),
                        separatorBuilder: (context, index) => Container(
                          height: 1,
                          color: Colors.grey[300],
                        ),
                        itemCount: controller.elementsList.length,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
