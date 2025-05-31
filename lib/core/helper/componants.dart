import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/core/helper/global_helper.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';

Divider appDivider({Color? color, double? height, double? thickness}) =>
    Divider(
      color: color ?? ColorsManager.greenWhiteColor,
      height: height ?? (GlobalHelper.isTablet ? 80.h : 50.h),
      thickness: thickness ?? 1.5.h,
    );
