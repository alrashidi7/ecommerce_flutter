import 'package:flutter/material.dart';

import '../../../consts/app_config.dart';
import '../../../consts/app_styles.dart';

class GlobalButton extends StatelessWidget {
  String buttonText;
  Color backgroundBtnColor;
  Color btnTextColor;
  VoidCallback onPressed;

   GlobalButton(
      {Key? key,
      required this.backgroundBtnColor,
      required this.btnTextColor,
        required this.onPressed,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.07,
        decoration: BoxDecoration(
            color: backgroundBtnColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 2)
            ],
            borderRadius: BorderRadius.circular(AppConfig.largeDimensions)),
        child: Center(
          child: Text(buttonText,
              style:
                  textStyleNormal.copyWith(color: btnTextColor, fontSize: 20)),
        ),
      ),
    );
  }
}
