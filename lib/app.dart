import 'package:bookme_app/features/authentication/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookme_app/utils/theme/theme.dart';
import 'package:get/get.dart';

///------ setup themes, initiate bindings & animations
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Book Me',
      home: const OnBoardingScreen(),
      themeMode: ThemeMode.system,
      theme: BMAppTheme.lightTheme,
      darkTheme: BMAppTheme.darkTheme,
    );
  }
}