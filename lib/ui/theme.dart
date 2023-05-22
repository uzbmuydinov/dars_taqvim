import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class CustomColors{

  static Color bluishClr = const Color(0xFF4e5ae8);
  static Color bluishClrw = Colors.orange;
  static Color yellowClr = const Color(0xFFFFB746);
  static Color pinkClr = const Color(0xFFff4667);
  static Color white = Colors.white;
  static Color orange = const Color(0xFFffd700);
  static Color primaryClr = const Color(0xFF4e5ae8);
  Color appColors = const Color(0xFFFFB746);

  static Color darkGreyClr = const Color(0xFF424242);
  Color darkHeaderClr = const Color(0xFF424242);
}


class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: const Color(0xFF4e5ae8),
      brightness: Brightness.light);
  static final dark = ThemeData(
    backgroundColor: const Color(0xFF424242),
    primaryColor: const Color(0xFF424242),
    brightness: Brightness.dark,
  );
}
class GradientColors{
  static List<Color>sky=[const Color(0xFF6448FE),const Color(0xFF5FC6FF)];
  static List<Color>sunset=[const Color(0xFFFE6197),const Color(0xFFFFB463)];
  static List<Color>sea=[const Color(0xFF61A3FE),const Color(0xFF63FFD5)];
  static List<Color>mango=[const Color(0xFFFFA738),const Color(0xFFFFE130)];
  static List<Color>fire=[const Color(0xFFFF5DCD),const Color(0xFFFF8484)];
}



TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600],
  ));
}
