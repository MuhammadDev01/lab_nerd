import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/utils/assets.dart';

class ScienceNerdWord extends StatelessWidget {
  const ScienceNerdWord({
    super.key,
  });

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
                height: 40.h,
              ),
              SizedBox(
                width: 5.w,
              ),
              SvgPicture.asset(
                Assets.imagesSvgNerd,
                height: 40.h,
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
