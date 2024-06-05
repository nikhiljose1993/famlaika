import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/fonts.gen.dart';

class ThemeService {
  final ThemeData theme = ThemeData(
    primaryColor: Palette.primary,
    fontFamily: FontFamily.figtree,
    scaffoldBackgroundColor: Palette.scaffoldBackgroundColor,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.figtree(
          fontSize: 22, fontWeight: FontWeight.w600, color: Palette.foreground),
      headlineMedium: GoogleFonts.figtree(
          fontSize: 18, fontWeight: FontWeight.w500, color: Palette.foreground),
      headlineSmall: GoogleFonts.figtree(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Palette.scaffoldBackgroundColor),
      //
      titleLarge: GoogleFonts.figtree(fontSize: 16, color: Palette.foreground),
      //
      bodyLarge: GoogleFonts.sen(
          fontSize: 14, fontWeight: FontWeight.w600, color: Palette.foreground),
      bodyMedium: GoogleFonts.sen(
          fontSize: 14, fontWeight: FontWeight.w500, color: Palette.foreground),
      bodySmall: GoogleFonts.sen(fontSize: 14, color: Palette.foreground),
      //
      labelLarge: GoogleFonts.sen(
          fontSize: 16, fontWeight: FontWeight.bold, color: Palette.foreground),
      labelMedium: GoogleFonts.sen(
          fontSize: 14, fontWeight: FontWeight.bold, color: Palette.foreground),
      labelSmall: GoogleFonts.sen(fontSize: 12, color: Palette.foreground),
    ),
  );
}
