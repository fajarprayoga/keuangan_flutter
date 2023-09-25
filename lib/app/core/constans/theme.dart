import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final gFont = GoogleFonts.roboto(
    fontSize: 15.5,
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: FontWeight.w100);

ThemeData appTheme = ThemeData(
  useMaterial3: false,
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Colors.white,
    elevation: .5,
    titleTextStyle: gFont.copyWith(fontSize: 20, color: Colors.black87),
    iconTheme: const IconThemeData(color: Colors.black87, size: 20),
  ),
  iconTheme: const IconThemeData(color: Colors.black87, size: 20),
  textTheme: TextTheme(
    bodyLarge: gFont,
    bodyMedium: gFont,
    titleMedium: gFont,
    titleSmall: gFont,
  ),
);
