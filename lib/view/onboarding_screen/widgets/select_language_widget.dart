import 'package:ecommerce_flutter/consts/app_assets.dart';
import 'package:ecommerce_flutter/consts/app_config.dart';
import 'package:ecommerce_flutter/consts/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/language_provider/language_provider.dart';

class SelectLanguageWidget extends StatelessWidget {
  const SelectLanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LanguageItem(languageIcon: englishIcon, languageTitle: "English"),
          LanguageItem(languageIcon: arabicIcon, languageTitle: "Arabic")
        ],
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  String languageIcon;
  String languageTitle;

  LanguageItem(
      {Key? key, required this.languageIcon, required this.languageTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    LanguageProvider language = Provider.of<LanguageProvider>(context);
    return Container(
      width: size.width * 0.38,
      height: size.height * 0.2,
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: (){
              languageTitle == 'Arabic'?
              language.changeLanguageToArabic(context):
              language.changeLanguageToEnglish(context);
            },
            child: Container(
              width: size.width * 0.4,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  border:language.languageModel.languageName ==languageTitle? Border.all(color: Colors.green, width: 2):Border(),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(1, 1),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ],
                  borderRadius:
                      BorderRadius.circular(AppConfig.mediumDimensions)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          languageIcon,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    languageTitle,
                    style: textStyleNormal.copyWith(),
                  )
                ],
              ),
            ),
          ),

          language.languageModel.languageName == languageTitle? Positioned(
            top: -10,
            right: -10,
            child: Container(
                decoration:
                    BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                child: FaIcon(
                  FontAwesomeIcons.circleCheck,
                  color: Colors.white,
                  size: 29,
                )),
          ):SizedBox()
        ],
      ),
    );
  }
}
