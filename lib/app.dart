import 'package:flutter/material.dart';
import 'package:bookme_app/utils/theme/theme.dart';

///------ setup themes, initiate bindings & animations
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Me',
      themeMode: ThemeMode.system,
      theme: BMAppTheme.lightTheme,
      darkTheme: BMAppTheme.darkTheme,
    );
  }
}