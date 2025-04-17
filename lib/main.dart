import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/helper/cached_helper.dart';
import 'package:lab_nerd/helper/dio_helper.dart';
import 'package:lab_nerd/routes/app_router.dart';
import 'package:lab_nerd/utils/themes/dark_theme.dart';
import 'package:lab_nerd/utils/themes/default_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedHelper.init();
  DioHelper.init();
  CachedHelper.getData(key: 'isDark') ??
      CachedHelper.saveData(key: 'isDark', value: false);
  bool isDark = CachedHelper.getData(key: 'isDark');
  runApp(
    DevicePreview(
      builder: (_) => MyApp(isDark),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(
    this.isDark, {
    super.key,
  });
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true, 
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppRouter.routes,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        initialRoute: Routes.splashView,
        textDirection: TextDirection.ltr,
        theme: defaultTheme,
        darkTheme: darkTheme,
        themeMode: isDark == true ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
