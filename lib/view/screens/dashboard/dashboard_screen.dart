import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/consts/app_assets.dart';
import 'package:ecommerce_flutter/consts/app_config.dart';
import 'package:ecommerce_flutter/consts/app_styles.dart';
import 'package:ecommerce_flutter/view/screens/dashboard/widgets/category_item_widget.dart';
import 'package:ecommerce_flutter/view/screens/dashboard/widgets/circle_user_img_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../helper/sharedPref_helper.dart';
import 'widgets/slider_offers.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController searchController = TextEditingController();

  int currentSelected = 0;
  @override
  void initState() {
    // TODO: implement initState
    isLogin.$ = false; 
    isLogin.save();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print('is login :::${userData.$}');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: textStyleNormal.copyWith(color: Colors.white),
          ),
          centerTitle: true,
          actions: [UserImgHeader()],
          bottom: PreferredSize(
              child: _searchWidget(size),
              preferredSize: Size(size.width, size.height * 0.1)),
          elevation: 0,
        ),
        body: Column(
          children: [
            SliderOffers(),
            _categoriesWidget(size)
          ],
        ));
  }

  Widget _searchWidget(Size size) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConfig.smallDimensions),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.95,
            height: size.height * 0.065,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConfig.mediumDimensions),
                color: Colors.white),
            child: Center(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Container(
                        width: 20,
                        height: size.height * 0.065,
                        alignment: Alignment.center,
                        child: FaIcon(FontAwesomeIcons.search)),
                    hintText: 'Search here..',
                    contentPadding: EdgeInsets.only(
                        left: AppConfig.largeDimensions,
                        right: AppConfig.smallDimensions,
                        top: AppConfig.largeDimensions),
                    hintStyle: textStyleHint.copyWith(color: Colors.black)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _categoriesWidget(Size size) {
    List<String> categoryImages = [allIcon, watchIcon, shoesIcon];
    List<String> categoryTitles = ['All', 'Watch', 'Footwear'];
    return Container(
      height: size.height * 0.07,
      width: size.width,
      child: ListView.builder(
          itemCount: categoryTitles.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: AppConfig.mediumDimensions,right: AppConfig.mediumDimensions),
          child: GestureDetector(
            onTap: (){
              setState(() {
                currentSelected = index;
              });
            },
            child: CategoryItemWidget(
                categoryImage: categoryImages[index],
                categoryTitle: categoryTitles[index],
                isSelected:currentSelected ==index ?true: false),
          ),
        );
      }),
    );
  }
}
