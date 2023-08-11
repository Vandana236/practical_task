import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_task/view/splash.dart';

import 'view/home.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation with GetX',
      initialRoute: '/splash', // Set your initial route as needed.
      getPages: [
        GetPage(name: '/splash', page: () => SplashPage()),
        GetPage(name: '/home', page: () => Home()),

      ],
    );
  }
}
