import 'package:ecommerce_flutter/consts/app_config.dart';
import 'package:ecommerce_flutter/consts/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  String categoryTitle;
  String categoryImage;
  bool isSelected;

  CategoryItemWidget(
      {Key? key,
      required this.categoryImage,
      required this.categoryTitle,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: Offset(0,1),
            blurRadius: 0.5,
            spreadRadius: 0.5
          )
        ],
        borderRadius: BorderRadius.circular(AppConfig.smallDimensions),
      ),
      padding: EdgeInsets.only(right: AppConfig.mediumDimensions,left:  AppConfig.mediumDimensions,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            categoryImage,
            width: 20,
            color: isSelected ? Colors.red.withOpacity(0.7) : Colors.black,
          ),
          SizedBox(
            width: AppConfig.largeDimensions,
          ),
          Text(categoryTitle,
              style: textStyleNormal.copyWith(
                  color:
                      isSelected ? Colors.red.withOpacity(0.7) : Colors.black))
        ],
      ),
    );
  }
}
