import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/data/local_data.dart';
import 'package:lab_nerd/core/helper/global_helper.dart';
import 'package:lab_nerd/core/routes/app_router.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/themes/dark_theme.dart';
import 'package:lab_nerd/core/themes/light_theme.dart';
import 'package:lab_nerd/views/components/constant.dart';

class ScienceNerdApp extends StatelessWidget {
  const ScienceNerdApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    log(MediaQuery.sizeOf(context).width.toString());
    log(MediaQuery.sizeOf(context).height.toString());

    GlobalHelper.isTablet = MediaQuery.sizeOf(context).width > 600;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          title: 'Science Nerd',
          debugShowCheckedModeBanner: false,
          getPages: AppRouter.routes,
          initialRoute: Routes.splashView,
          textDirection: TextDirection.ltr,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: LocalData.userBox.get(kDarkMode) == true
              ? ThemeMode.dark
              : ThemeMode.light,
        );
      },
    );
  }
}
