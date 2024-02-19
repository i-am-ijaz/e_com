import 'package:flutter/material.dart';

import 'package:e_com/app/view/theme/colors.dart';

class AppTheme {
  AppTheme._();
  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: kBlackColor,
    primary: kBlackColor,
  );

  static ThemeData get lightTheme => ThemeData(
        primaryColor: kBlackColor,
        useMaterial3: false,
        scaffoldBackgroundColor: kWhiteColor,
        appBarTheme: const AppBarTheme(
          foregroundColor: kWhiteColor,
          elevation: 1,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kBlackColor,
          foregroundColor: kWhiteColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlackColor,
            foregroundColor: kWhiteColor,
            shape: const RoundedRectangleBorder(),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: kBlackColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
          ),
          labelStyle: TextStyle(
            color: kBlackColor,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kBlackColor,
          ),
        ),
      );
}
