import 'package:flutter/material.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';

Divider appDivider({Color? color, double? height, double? thickness}) =>
    Divider(
      color: color ?? ColorsManager.greenWhiteColor,
      height: height ?? 80,
      thickness: thickness ?? 1.5,
    );
