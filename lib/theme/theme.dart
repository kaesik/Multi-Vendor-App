import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200,
    primary: Colors.grey.shade400,
    secondary: Colors.grey.shade600,
    error: Colors.red.shade300,
    onBackground: Colors.grey.shade900,
    onPrimary: Colors.grey.shade900,
    onSecondary: Colors.grey.shade900,
    outline: Colors.grey.shade900,
  ),
  textTheme: GoogleFonts.josefinSansTextTheme().copyWith().apply(
        bodyColor: Colors.grey.shade900,
        displayColor: Colors.grey.shade900,
      ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade500,
    error: Colors.red.shade300,
    onBackground: Colors.grey.shade200,
    onPrimary: Colors.grey.shade200,
    onSecondary: Colors.grey.shade200,
    outline: Colors.grey.shade200,
  ),
  textTheme: GoogleFonts.josefinSansTextTheme().copyWith().apply(
        bodyColor: Colors.grey.shade200,
        displayColor: Colors.grey.shade200,
      ),
);
