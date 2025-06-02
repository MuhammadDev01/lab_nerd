import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_nerd/data/local_data.dart';
import 'package:lab_nerd/science_nerd_app.dart';
import 'package:lab_nerd/core/utils/constant.dart';
import 'package:lab_nerd/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(kAuthBox);
  await Hive.openBox(kUserBox);
  await LocalData.init();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ScienceNerdApp(),
    ),
  );
}
