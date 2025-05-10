import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/routes/app_router.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/themes/dark_theme.dart';
import 'package:lab_nerd/core/utils/themes/default_theme.dart';
import 'package:lab_nerd/firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kAuthBox);
  await Hive.openBox(kUserBox);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // DioHelper.init();
  // CachedHelper.getData(key: 'isDark') ??
  //     CachedHelper.saveData(key: 'isDark', value: false);
  // bool isDark = CachedHelper.getData(key: 'isDark');
  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => LabNerdApp(),
    ),
  );
}

class LabNerdApp extends StatelessWidget {
  const LabNerdApp({
    super.key,
  });
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
        themeMode: CacheHelper.userBox.get(kDarkMode) == true
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }
}
