import 'package:flutter/material.dart';

class BMElevatedButtonTheme {
  BMElevatedButtonTheme._();

  /// -- Light theme for buttons
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: Colors.indigo,
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.grey,
    side: const BorderSide(color: Colors.indigo),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  );

  /// -- Dark theme for buttons
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.indigo,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: Colors.indigo),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}