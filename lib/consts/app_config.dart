import 'dart:ui';

class AppConfig{
  //api_config
  static const String DOMAIN_PATH = "https://hatweb.stackdeans.com"; //localhost
  static const String API_ENDPATH = "api/v2";
  static const String BASE_URL = "${DOMAIN_PATH}/${API_ENDPATH}";

  //colors
  static const Color primaryColor = Color(0xFF3E5164);
  static const Color accentColor = Color(0xFFFCC275);
  //dimensions
  static const double smallDimensions = 4;
  static const double mediumDimensions = 8;
  static const double largeDimensions = 16;
  static const double veryLargeDimensions = 32;

}