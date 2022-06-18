import 'dart:async';

import 'package:ecommerce_flutter/consts/app_config.dart';
import 'package:ecommerce_flutter/consts/app_styles.dart';
import 'package:ecommerce_flutter/helper/sharedPref_helper.dart';
import 'package:ecommerce_flutter/view/onboarding_screen/onboarding_page.dart';
import 'package:ecommerce_flutter/view/screens/auth/login/login_screen.dart';
import 'package:ecommerce_flutter/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../consts/app_assets.dart';
import '../../../helper/navigator_to/starting_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    isLogin.load();
    isFirstTime.load();
    Timer(const Duration(seconds: 3), ((){
      StartingPage().callNextPage(context);
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlayAnimation<double>(
              tween: Tween<double>(
                  begin: size.height * 0.1, end: size.height * 0.3),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,

              builder: (context, child, value) {
                // apply animated value obtained from builder function parameter
                return Container(
                  width: value,
                  height: value,
                  child: child,
                );
              },
              child: Image.asset(logoSplashScreen),
            ),
            const SizedBox(
              height: AppConfig.largeDimensions,
            ),
            PlayAnimation<double>(
              tween: Tween<double>(begin: size.width, end: size.width),

              duration: const Duration(seconds: 1),

              curve: Curves.fastOutSlowIn,

              builder: (context, child, value) {
                return Container(
                  width: value,
                  child: child,
                );
              },
              child: Center(
                child: RichText(text: TextSpan(text: 'Ecommerce ',
                    style: textStyleNormal.copyWith(
                        color: primaryColor),
                    children: [
                      TextSpan(text: 'Final ',
                        style: textStyleNormal.copyWith(
                            color: accentColor),),
                      TextSpan(text: 'Project')
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
