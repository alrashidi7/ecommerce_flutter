import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flutter/consts/app_config.dart';
import 'package:ecommerce_flutter/consts/app_styles.dart';
import 'package:ecommerce_flutter/providers/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_value/shared_value.dart';

import 'helper/sharedPref_helper.dart';
import 'view/screens/splash/splash_screen.dart';
import 'view/screens/test_counter/test_scren.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales:const [Locale('en'), Locale('ar')],
      path: 'assets/languages', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: SharedValue.wrapApp(const MyApp())));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    localLanguage.load();
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
              primarySwatch: primaryColorPalette,
              primaryColor: primaryColor),
          home: const CounterScreen()),
    );
  }
}


