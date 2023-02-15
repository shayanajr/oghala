import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'splash/splashScreen.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'user.dart';
import 'package:flutter/services.dart';
import 'profile_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await Firebase.initializeApp();
  await _initHive();

  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

Future<void> _initHive() async {
  if (kIsWeb) {
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(ProfileAdapter());
  } else {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(UserAdapter())
      ..registerAdapter(ProfileAdapter());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}
