import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/allSongs_controller.dart';
import 'views/home_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AllSongs());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
      // initialBinding: ,
    );
  }
}
