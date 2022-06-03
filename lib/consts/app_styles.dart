import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//palette.dart
import 'package:flutter/material.dart';
class Palette {
  // #3366ff
  static const MaterialColor primaryColorPalette = MaterialColor(
    0xFF3E5164, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFF3E5164),//10%
      100: Color(0xFF3E5164),//20%
      200: Color(0xFF3E5164),//30%
      300: Color(0xFF3E5164),//40%
      400: Color(0xFF3E5164),//50%
      500: Color(0xFF3E5164),//60%
      600: Color(0xFF3E5164),//70%
      700: Color(0xFF3E5164),//80%
      800: Color(0xFF3E5164),//90%
      900: Color(0xFF3E5164),//100%
    },
  );
}


final TextStyle textStyleNormal = GoogleFonts.quicksand(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600
);
