import 'package:ecommerce_flutter/consts/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../../helper/sharedPref_helper.dart';

class UserImgHeader extends StatelessWidget {
  const UserImgHeader({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Container
      (
      width: 50,height: 50,
      child: CircleAvatar(
        backgroundImage: isLogin.$? const AssetImage(userImg) :AssetImage('assets/images/guest.png'),
      ),
    );
  }
}
