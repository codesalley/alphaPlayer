import 'package:alpha/controllers/appBinding.dart';
import 'package:alpha/views/home_Screen.dart';
import 'package:alpha/views/splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controllers/allSongs_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter;
  Get.put(AllSongs());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(visualDensity: VisualDensity.adaptivePlatformDensity),

      initialRoute: 'Splash',
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: 'Splash', page: () => SplashScreen()),
        GetPage(name: 'HomeScreen', page: () => HomeScreen()),
        // GetPage(name: 'S', page: () => HomeScreen(),
      ],
      // initialBinding: ,
    );
  }
}
