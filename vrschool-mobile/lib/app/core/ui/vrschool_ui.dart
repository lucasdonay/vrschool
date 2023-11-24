import 'package:flutter/material.dart';
import 'package:vrschool_mobile/app/core/ui/colors.dart';

class VrSchoolUi {
  VrSchoolUi._();

  static final TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: 'Poppins',
    color: VrColors.textPrimary,
  );

  static final TextStyle headline1DarkMode = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: 'Poppins',
    color: const Color.fromARGB(255, 238, 238, 238),
  );

  static final TextStyle headline2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    color: VrColors.textSecondary,
  );

  static final TextStyle headline2DarkMode = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    color: const Color.fromARGB(255, 238, 238, 238),
  );

  static final TextStyle headline3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: VrColors.textSecondary,
  );

  static final TextStyle headline3DarkMode = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: const Color.fromARGB(255, 238, 238, 238),
  );

  static ThemeData get theme => ThemeData(
        textTheme: TextTheme(
          displayLarge: headline1,
          displayMedium: headline2,
          displaySmall: headline3,
        ),
        primaryColor: const Color.fromARGB(255, 245, 125, 72),
        primaryColorLight: const Color.fromARGB(255, 255, 140, 91),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 245, 125, 72),
          ),
        ),
      );
}
