import '../../view/onboarding_screen/onboarding_page.dart';
import '../../view/screens/auth/login/login_screen.dart';
import '../../view/screens/dashboard/dashboard_screen.dart';
import '../sharedPref_helper.dart';

import 'package:flutter/material.dart';
class StartingPage {

  callNextPage(BuildContext context) {
    if (isFirstTime.$) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>OnBoardingPage()), (route) => false);
    }else{
      if (isLogin.$) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const DashboardScreen()), (
            route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(
            builder: (_) =>
                LoginScreen(hasPreviousPage: false,)),
                (
            route) => false);
      }
    }
  }
}