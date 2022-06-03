import 'package:ecommerce_flutter/consts/app_config.dart';
import 'package:ecommerce_flutter/consts/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_value/shared_value.dart';

import 'view/screens/splash/splash_screen.dart';

void main() {
  runApp(SharedValue.wrapApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Palette.primaryColorPalette,
            primaryColor: Colors.amber),
        home: const SplashScreen());
  }
}
