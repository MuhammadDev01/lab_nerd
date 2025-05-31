import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/data/local_data.dart';
import 'package:lab_nerd/core/routes/app_router.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/themes/dark_theme.dart';
import 'package:lab_nerd/core/themes/light_theme.dart';
import 'package:lab_nerd/core/utils/constant.dart';

class ScienceNerdApp extends StatelessWidget {
  const ScienceNerdApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    log(MediaQuery.sizeOf(context).width.toString());
    log(MediaQuery.sizeOf(context).height.toString());

    return GetMaterialApp(
      useInheritedMediaQuery: true,
      title: 'Science Nerd',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
  }
}
