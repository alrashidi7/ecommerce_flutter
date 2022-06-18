import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color accentColor  = Color(0xFFFCC275);
const Color primaryColor= Color(0xFF263238);
const Color backgroundScaffold = Color(0xFFFFFFFF);
const MaterialColor primaryColorPalette = MaterialColor(
  0xFF263238, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(0xFF263238),//10%
    100: Color(0xFF263238),//20%
    200: Color(0xFF263238),//30%
    300: Color(0xFF263238),//40%
    400: Color(0xFF263238),//50%
    500: Color(0xFF263238),//60%
    600: Color(0xFF263238),//70%
    700: Color(0xFF263238),//80%
    800: Color(0xFF263238),//90%
    900: Color(0xFF263238),//100%
  },
);

final TextStyle textStyleNormal = GoogleFonts.quicksand(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600
);
final TextStyle textStyleHint = GoogleFonts.quicksand(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w400
);
