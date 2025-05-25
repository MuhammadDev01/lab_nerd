import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/routes/app_router.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/themes/dark_theme.dart';
import 'package:lab_nerd/core/themes/default_theme.dart';
import 'package:lab_nerd/widgets/constant.dart';

class ScienceNerdApp extends StatelessWidget {
  const ScienceNerdApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          title: 'Science Nerd',
          debugShowCheckedModeBanner: false,
          getPages: AppRouter.routes,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          initialRoute: Routes.splashView,
          textDirection: TextDirection.ltr,
          theme: defaultTheme,
          darkTheme: darkTheme,
          themeMode: CacheHelper.userBox.get(kDarkMode) == true
              ? ThemeMode.dark
              : ThemeMode.light,
        );
      },
    );
  }
}
