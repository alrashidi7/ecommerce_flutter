import 'package:ecommerce_flutter/consts/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../helper/sharedPref_helper.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text('dashboard',style: textStyleNormal,),
      ),
    );
  }
}
