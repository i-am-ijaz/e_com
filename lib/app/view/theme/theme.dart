import 'package:flutter/material.dart';

import 'package:e_com/app/view/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
        fontFamily: GoogleFonts.inter().fontFamily,
        primaryTextTheme: GoogleFonts.interTextTheme(),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: kBlackColor,
          ),
          bodyMedium: TextStyle(
            color: kBlackColor,
          ),
          bodySmall: TextStyle(
            color: kBlackColor,
          ),
          displayLarge: TextStyle(
            color: kBlackColor,
          ),
          displayMedium: TextStyle(
            color: kBlackColor,
          ),
          displaySmall: TextStyle(
            color: kBlackColor,
          ),
          headlineLarge: TextStyle(
            color: kBlackColor,
          ),
          headlineMedium: TextStyle(
            color: kBlackColor,
          ),
          headlineSmall: TextStyle(
            color: kBlackColor,
          ),
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
            shape: const RoundedRectangleBorder(),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(kWhiteColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
          ),
          side: const BorderSide(
            width: 2,
          ),
        ),
      );
}
