import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/models/element_model.dart';
import 'package:lab_nerd/views/main/widgets/background_gradient.dart';
import 'package:lab_nerd/widgets/app_rich_text.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsElementView extends StatelessWidget {
  const DetailsElementView({
    super.key,
    required this.element,
  });
  final ElementModel element;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          BackgroundGradient(
            gradient: Get.isDarkMode
                ? ColorsManager.darkHomeGradient
                : ColorsManager.lightHomeGradient,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detailsAppBar(),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  _elementCover(),
                  _elementAvatar(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  spacing: 10.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppRichText(
                      title: 'Name:  ',
                      description: element.name,
                    ),
                    AppRichText(
                      title: 'Symbol:  ',
                      description: element.symbol,
                    ),
                    AppRichText(
                      title: 'Phase:  ',
                      description: element.phase,
                    ),
                    AppRichText(
                      title: 'Description:  ',
                      description: element.image!.title!,
                    ),
                    AppRichText(
                      title: 'Atomic Number:  ',
                      description: element.atomicNumber.toString(),
                    ),
                    AppRichText(
                      title: 'Atomic Mass:  ',
                      description: element.atomicMass.toString(),
                    ),
                    AppRichText(
                      title: 'Electron Configuration:  ',
                      description: element.electronConfiguration,
                    ),
                    AppRichText(
                      title: 'Electron Configuration Semantic:  ',
                      description: element.electronConfigurationSemantic,
                    ),
                    Row(
                      children: [
                        Text(
                          'Source:',
                          style: TextStyles.rem16Bold.copyWith(
                            color: Colors.teal,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Uri uri = Uri.parse(element.source);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri,
                                  mode: LaunchMode.externalApplication);
                            } else {
                              appSnackbar(
                                  title: 'Failed',
                                  message: 'try again',
                                  backgroundColor: ColorsManager.errorColor);
                            }
                          },
                          child: Text(
                            'Click Here',
                            style: TextStyles.rem16Bold.copyWith(
                              color: Colors.blue[600],
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _elementAvatar() {
    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(
            element.image?.url ?? element.bohrModelImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container _elementCover() {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(element.bohrModelImage),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.white38,
          BlendMode.dstATop,
        ),
      )),
    );
  }

  AppBar _detailsAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Text(
        'Details',
        style: TextStyle(
          letterSpacing: 1,
          fontSize: 28,
        ),
      ),
      centerTitle: true,
    );
  }
}
