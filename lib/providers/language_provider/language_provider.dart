import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flutter/consts/app_assets.dart';
import 'package:ecommerce_flutter/consts/app_strings.dart';
import 'package:ecommerce_flutter/helper/sharedPref_helper.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {

  LanguageProvider(){

    getInitialLanguage();
  }

  void getInitialLanguage(){
    if(localLanguage.$ == arabicLang){
      languageModel =  LanguageModel(languageImage: arabicIcon, languageName: arabicLang);
    }else{
      languageModel =  LanguageModel(languageImage: englishIcon, languageName: englishLang);
    }
  }

  LanguageModel languageModel = LanguageModel(languageImage: englishIcon, languageName: englishLang);



  changeLanguageToArabic(BuildContext context){
    localLanguage.$ = arabicLang;
    localLanguage.save();
    languageModel = LanguageModel(languageImage: arabicIcon, languageName: arabicLang);
    context.setLocale(Locale('ar'));
    notifyListeners();

  }

  changeLanguageToEnglish(BuildContext context){
    localLanguage.$ = englishLang;
    localLanguage.save();
    languageModel = LanguageModel(languageImage: englishIcon, languageName: englishLang);
    context.setLocale(Locale('en'));
    notifyListeners();
  }
}

class LanguageModel {
  String languageImage;
  String languageName;

  LanguageModel({required this.languageImage, required this.languageName});
}
