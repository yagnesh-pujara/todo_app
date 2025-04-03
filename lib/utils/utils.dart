import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final Color bgColor = Color(0xFFF2EDED);
  static final Color whiteColor = Color(0xFFFFFFFF);
  static final Color geryColor = Color(0xFF626262);
  static final Color blackColor = Color(0xFF3A3A3A);
  static final Color blueColor = Color(0xFF1A73E9);
  static final Color redColor = Color(0xFFE3242B);
}

class AppAssets {
  static final String calendarIcon = 'assets/calendar_icon.png';
  static final String noTaskFound = 'assets/no_task_found_icon.png';
  static final String gymIcon = 'assets/gym_icon.png';
}

class AppTheme {
  static final ThemeData lightTextTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blueColor),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      titleLarge: AppTextStyles.titleLarge,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
    ),
  );
}

class AppTextStyles {
  static final displayLarge = GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static final displayMedium = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static final titleLarge = GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.blackColor,
  );

  static final titleMedium = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.blackColor,
  );

  static final bodyLarge = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
  static final bodyMedium = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.blackColor,
  );
  static final bodySmall = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.blackColor,
  );
}
