import 'package:flutter/material.dart';
import 'package:vrschool_mobile/app/core/ui/colors.dart';
/* -- Light & Dark Elevated Button Themes -- */
class VrElevatedButtonTheme {
  VrElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: VrColors.primary,
      backgroundColor: VrColors.primary,
      disabledForegroundColor: VrColors.darkGrey,
      side: const BorderSide(color: VrColors.primary),
      textStyle: const TextStyle(
          fontSize: 16, color: VrColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: VrColors.light,
      backgroundColor: VrColors.primary,
      disabledForegroundColor: VrColors.darkGrey,
      disabledBackgroundColor: VrColors.darkerGrey,
      side: const BorderSide(color: VrColors.primary),
      textStyle: const TextStyle(
          fontSize: 16, color: VrColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
