import 'package:flutter/material.dart';
import 'package:bookme_app/utils/theme/custom_themes/text_theme.dart';
import 'package:bookme_app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:bookme_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:bookme_app/utils/theme/custom_themes/bottomsheet_theme.dart';
import 'package:bookme_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:bookme_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:bookme_app/utils/theme/custom_themes/outlinedbutton_theme.dart';
import 'package:bookme_app/utils/theme/custom_themes/textfield_theme.dart';

class BMAppTheme {
  BMAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.white,
    textTheme: BMTextTheme.lightTextTheme,
    elevatedButtonTheme: BMElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: BMAppbarTheme.lightAppBarTheme,
    bottomSheetTheme: BMBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: BMCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: BMChipTheme.lightChipTheme,
    outlinedButtonTheme: BMOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: BMTextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.black,
    textTheme: BMTextTheme.darkTextTheme,
    elevatedButtonTheme: BMElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: BMAppbarTheme.darkAppBarTheme,
    bottomSheetTheme: BMBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: BMCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: BMChipTheme.darkChipTheme,
    outlinedButtonTheme: BMOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: BMTextFieldTheme.darkInputDecorationTheme,
  );
}