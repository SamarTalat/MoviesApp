import 'package:flutter/material.dart';
import 'package:movieapp/core/utils/movies_colors.dart';

class MoviesTheme {
  static ThemeData mainTheme = ThemeData(
    scaffoldBackgroundColor: MoviesColors.blackColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1D1E1D),
      foregroundColor: MoviesColors.whiteColor,
    ),
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: "Poppins",
  );
}
