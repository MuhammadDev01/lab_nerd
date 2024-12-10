import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/helper/cached_helper.dart';
import 'package:lab_nerd/helper/dio_helper.dart';
import 'package:lab_nerd/logic/controllers/login_controller.dart';
import 'package:lab_nerd/routes/app_router.dart';
import 'package:lab_nerd/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedHelper.init();
  var loginController = Get.put(LoginController());
  loginController.moveEyes();
  DioHelper.init();
  CachedHelper.getData(key: 'isDark') ??
      CachedHelper.saveData(key: 'isDark', value: false);
  bool isDark = CachedHelper.getData(key: 'isDark');
  runApp(
    MyApp(isDark),
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.routes,
      initialRoute: Routes.splashView,
      textDirection: TextDirection.ltr,
      theme: ThemeApp.defaultTheme,
      darkTheme: ThemeApp.darkTheme,
      themeMode: isDark == true ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
