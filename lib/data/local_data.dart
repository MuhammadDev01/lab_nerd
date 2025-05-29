import 'package:hive/hive.dart';
import 'package:lab_nerd/views/components/constant.dart';

class LocalData {
  static Box authBox = Hive.box(kAuthBox);
  static Box userBox = Hive.box(kUserBox);

  static Future<void> init() async {
    if (userBox.get(kDarkMode) == null) await userBox.put(kDarkMode, false);
  }
}
