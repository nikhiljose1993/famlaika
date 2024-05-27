import 'package:famlaika/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  primarySwatch: generateMaterialColor(Palette.primary),
  // fontFamily: FontFamily.sen,
  scaffoldBackgroundColor: Palette.scaffoldBackgroundColor,
  textTheme: TextTheme(
    headlineMedium: GoogleFonts.sen(fontSize: 26, fontWeight: FontWeight.bold),
    headlineSmall: GoogleFonts.sen(fontSize: 20, fontWeight: FontWeight.bold),
    //
    titleLarge: GoogleFonts.sen(fontSize: 20),
    titleMedium: GoogleFonts.sen(fontSize: 18, fontWeight: FontWeight.bold),
    titleSmall: GoogleFonts.sen(fontSize: 16),
    //
    bodyLarge: GoogleFonts.sen(fontSize: 14),
    bodyMedium: GoogleFonts.sen(fontSize: 12),
    bodySmall: GoogleFonts.sen(fontSize: 10),
    //
    labelLarge: GoogleFonts.sen(fontSize: 16, fontWeight: FontWeight.bold),
    labelMedium: GoogleFonts.sen(fontSize: 14, fontWeight: FontWeight.bold),
    labelSmall: GoogleFonts.sen(fontSize: 12, fontWeight: FontWeight.bold),
  ),
);
