import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_nerd/lab_nerd_app.dart';
import 'package:lab_nerd/widgets/constant.dart';
import 'package:lab_nerd/firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kAuthBox);
  await Hive.openBox(kUserBox);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => LabNerdApp(),
    ),
  );
}
