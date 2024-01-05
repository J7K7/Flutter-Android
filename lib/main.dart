import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ums_demo/Themes/AppTheme.dart';
import 'package:ums_demo/pages/WelcomeScreen/Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(
      builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          themeMode: ThemeMode.dark,
          home: WelcomeScreen(),
        );
      },
    );
  }
}
