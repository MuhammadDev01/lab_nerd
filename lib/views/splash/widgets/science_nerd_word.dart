import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class ScienceNerdWord extends StatelessWidget {
  const ScienceNerdWord({
    super.key,
  });
  final size = 40;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.imagesSvgScience,
                height: MediaQuery.sizeOf(context).width > 600
                    ? size.h * 2
                    : size.h,
              ),
              SizedBox(
                width: 5.w,
              ),
              SvgPicture.asset(
                Assets.imagesSvgNerd,
                height: MediaQuery.sizeOf(context).width > 600
                    ? size.h * 2
                    : size.h,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SvgPicture.asset(
          Assets.imagesSvgChemistryForEveryone,
          height: 20.h,
        ),
      ],
    );
  }
}
