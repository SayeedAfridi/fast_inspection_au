import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Colors.purple;
  static const bool isUsingM3 = true;

  static OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    ),
  );

  static FilledButtonThemeData filledButtonThemeData = FilledButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    ),
  );

  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    primarySwatch: primaryColor,
    brightness: Brightness.dark,
    useMaterial3: isUsingM3,
    outlinedButtonTheme: outlinedButtonThemeData,
    textButtonTheme: textButtonThemeData,
    filledButtonTheme: filledButtonThemeData,
  );

  static ThemeData light = ThemeData(
    primarySwatch: primaryColor,
    brightness: Brightness.light,
    useMaterial3: isUsingM3,
    outlinedButtonTheme: outlinedButtonThemeData,
    textButtonTheme: textButtonThemeData,
    filledButtonTheme: filledButtonThemeData,
  );
}
