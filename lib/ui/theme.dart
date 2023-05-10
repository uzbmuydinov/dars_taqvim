import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';


const Color bluishClr=Color(0xFF4e5ae8);
const Color bluishClrw=Colors.orange;
const Color yellowClr=Color(0xFFFFB746);
const Color pinkClr=Color(0xFFff4667);
const Color white=Colors.white;
const Color orange=Color(0xFFffd700);
const primaryClr=bluishClr;
Color appColors = const   Color(0xFFFFB746);

const Color darkGreyClr=Color(0xFF424242);
Color darkHeaderClr=const Color(0xFF424242);


class Themes{
  static final light=ThemeData(
    backgroundColor: Colors.white,
      primaryColor: primaryClr,
      brightness:Brightness.light

  );
  static final dark=ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.grey[400]:Colors.grey
    )
  );
}
TextStyle get headingStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode?Colors.white:Colors.black
      )
  );
}
TextStyle get titleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Get.isDarkMode?Colors.white:Colors.black
      )
  );
}
TextStyle get subTitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode?Colors.grey[100]:Colors.grey[600],
      )
  );
}

