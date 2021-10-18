import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/**
 * Class to define custom text style
 */
class CustomTextStyle {
  static TextStyle? quicksandBold(BuildContext context, Color color, double fontSize) {
    return GoogleFonts.quicksand(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle? workSansLightItalic(BuildContext context, Color color, double fontSize) {
    return GoogleFonts.workSans(
      fontSize: fontSize,
      color: color,
      fontStyle: FontStyle.italic
    );
  }

  static TextStyle? quicksandMedium(BuildContext context, Color color, double fontSize) {
    return GoogleFonts.quicksand(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500
    );
  }

  static TextStyle? quicksandRegular(BuildContext context, Color color, double fontSize) {
    return GoogleFonts.quicksand(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.normal
    );
  }

  static TextStyle? baloo(BuildContext context, Color color, double fontSize) {
    return GoogleFonts.baloo(
        fontSize: fontSize,
        color: color
    );
  }
}