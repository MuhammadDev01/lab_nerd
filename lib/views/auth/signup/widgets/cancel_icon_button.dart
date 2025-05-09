import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';

class CancelIconButton extends StatelessWidget {
  const CancelIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            FontAwesomeIcons.circleXmark,
            color: ColorsManager.greenWhite,
            size: 30,
          ),
        ),
      ),
    );
  }
}
