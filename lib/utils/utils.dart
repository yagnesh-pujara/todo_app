import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  //    LIGHT THEME COLORS
  static final Color bgColor = Color(0xFFF2EDED);
  static final Color whiteColor = Color(0xFFFFFFFF);
  static final Color geryColor = Color(0xFF626262);
  static final Color blackColor = Color(0xFF3A3A3A);
  static final Color blueColor = Color(0xFF1A73E9);
  static final Color redColor = Color(0xFFE3242B);

  //    DARK THEME COLORS
  static final Color darkThemeBgColor = Color(0xFF121212);
  static final Color darkThemeWhiteColor = Color(0xFFEDEDED);
  static final Color darkThemeGeryColor = Color(0xFFB0B0B0);
  static final Color darkThemeBlackColor = Color(0xFF1F1F1F);
  static final Color darkThemeBlueColor = Color(0xFF4285F4);
  static final Color darkThemeRedColor = Color(0xFFEF5350);
}

class AppAssets {
  static final String calendarIcon = 'assets/calendar_icon.png';
  static final String noTaskFound = 'assets/no_task_found_icon.png';
  static final String gymIcon = 'assets/gym_icon.png';
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blueColor),
    scaffoldBackgroundColor: AppColors.bgColor,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      titleLarge: GoogleFonts.roboto(fontSize: 16, color: AppColors.blackColor),
      titleMedium: GoogleFonts.roboto(
        fontSize: 14,
        color: AppColors.blackColor,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      bodyMedium: GoogleFonts.roboto(fontSize: 14, color: AppColors.blackColor),
      bodySmall: GoogleFonts.roboto(fontSize: 12, color: AppColors.blackColor),
    ),
  );

  //    DARK THEME

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkThemeBlueColor,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.darkThemeBgColor,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.darkThemeWhiteColor,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.darkThemeWhiteColor,
      ),
      titleLarge: GoogleFonts.roboto(
        fontSize: 16,
        color: AppColors.darkThemeWhiteColor,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 14,
        color: AppColors.darkThemeWhiteColor,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkThemeWhiteColor,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        color: AppColors.darkThemeWhiteColor,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        color: AppColors.darkThemeWhiteColor,
      ),
    ),
  );
}

class AppTextStyles {
  static TextStyle displayLarge(BuildContext context) =>
      Theme.of(context).textTheme.displayLarge!;

  static TextStyle displayMedium(BuildContext context) =>
      Theme.of(context).textTheme.displayMedium!;

  static TextStyle titleLarge(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!;

  static TextStyle titleMedium(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!;

  static TextStyle bodyLarge(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!;

  static TextStyle bodyMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!;

  static TextStyle bodySmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!;
}
