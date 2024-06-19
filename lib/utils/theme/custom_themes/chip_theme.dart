import 'package:flutter/material.dart';

class BMChipTheme {
  BMChipTheme._();

  /// -- For light chip theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.indigo,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );

  /// -- For dark chip theme
  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: Colors.indigo,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );
}