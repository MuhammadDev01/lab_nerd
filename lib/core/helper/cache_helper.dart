import 'package:hive/hive.dart';
import 'package:lab_nerd/widgets/constant.dart';

class CacheHelper {
  static Box authBox = Hive.box(kAuthBox);
  static Box userBox = Hive.box(kUserBox);
}
