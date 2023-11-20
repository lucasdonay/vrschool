import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VrSchoolUi {
  VrSchoolUi._();

  static final TextStyle headline1 =
      GoogleFonts.roboto(fontSize: 34, fontWeight: FontWeight.bold);
  static final TextStyle headline2 =
      GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold);
  static final TextStyle headline3 =
      GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold);
  // Adicione mais estilos conforme necessário

  static ThemeData get theme => ThemeData(
        textTheme: TextTheme(
          displayLarge: headline1,
          displayMedium: headline2,
          displaySmall: headline3,
          // Adicione mais estilos conforme necessário
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
