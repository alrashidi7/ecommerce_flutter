import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flutter/consts/app_assets.dart';
import 'package:ecommerce_flutter/consts/app_styles.dart';
import 'package:ecommerce_flutter/view/onboarding_screen/widgets/select_language_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../helper/navigator_to/starting_page.dart';
import '../../helper/sharedPref_helper.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  List<PageViewModel> onboarding = [];
  var pageDecoration;

  void _onIntroEnd(context) {
    isFirstTime.$ = false;
    isFirstTime.save();
    StartingPage().callNextPage(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    isFirstTime.load();
    pageDecoration = PageDecoration(
      titleTextStyle: textStyleNormal.copyWith(fontSize: 18),
      bodyTextStyle: textStyleNormal.copyWith(fontSize: 16),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    onboarding = [
      PageViewModel(
        title: "Flutter Ecommerce App",
        body: 'full_ecommerce_appp'.tr(),
        image: Image.asset(
          logoSplashScreen,
          width: 100,
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
          title: "multi_language_text".tr(),
          // body:
          // "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          image: Image.asset(
            languageIcon,
            width: 100,
          ),
          decoration: pageDecoration,
          bodyWidget: const SelectLanguageWidget()),
      PageViewModel(
        title: "Offers",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        image: Image.asset(
          offerIcon,
          width: 100,
        ),
        decoration: pageDecoration,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    onboarding = [
    PageViewModel(
      title: "Flutter Ecommerce App",
      body: 'full_ecommerce_app'.tr(),
      image: Image.asset(
        logoSplashScreen,
        width: 100,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
        title: "multi_language_text".tr(),
        // body:
        // "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        image: Image.asset(
          languageIcon,
          width: 100,
        ),
        decoration: pageDecoration,
        bodyWidget: const SelectLanguageWidget()),
    PageViewModel(
      title: "Offers",
      body:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      image: Image.asset(
        offerIcon,
        width: 100,
      ),
      decoration: pageDecoration,
    ),
  ];
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Image.asset(
              logoSplashScreen,
              width: 35,
            ),
          ),
        ),
      ),

      pages: onboarding,
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,

      back: const Icon(Icons.arrow_back),
      skip: Text('Skip'.tr(),
          style: textStyleNormal.copyWith(
              fontWeight: FontWeight.w600, color: Colors.white)),
      next: const Icon(Icons.arrow_forward),
      done: Text('Done',
          style: textStyleNormal.copyWith(
              fontWeight: FontWeight.w600, color: Colors.white)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFFFFFFF),
        activeSize: Size(22.0, 10.0),
        activeColor: accentColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
