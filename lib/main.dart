import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/cached_helper.dart';
import 'package:lab_nerd/core/helper/dio_helper.dart';
import 'package:lab_nerd/core/routes/app_router.dart';
import 'package:lab_nerd/core/utils/themes/dark_theme.dart';
import 'package:lab_nerd/core/utils/themes/default_theme.dart';
import 'package:lab_nerd/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CachedHelper.init();
  DioHelper.init();
  CachedHelper.getData(key: 'isDark') ??
      CachedHelper.saveData(key: 'isDark', value: false);
  bool isDark = CachedHelper.getData(key: 'isDark');
  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => LabNerdApp(isDark),
    ),
  );
}

class LabNerdApp extends StatelessWidget {
  const LabNerdApp(
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
        initialRoute: Routes.homeView,
        textDirection: TextDirection.ltr,
        theme: defaultTheme,
        darkTheme: darkTheme,
        themeMode: isDark == true ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
