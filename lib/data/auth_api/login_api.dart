import 'dart:async';
import 'dart:io';

import 'package:ecommerce_flutter/consts/app_config.dart';
import 'package:ecommerce_flutter/helper/sharedPref_helper.dart';
import 'package:ecommerce_flutter/models/auth/error_auth_model.dart';
import 'package:ecommerce_flutter/models/auth/login_model.dart';
import 'package:http/http.dart'as http;
class LoginApi {
 Future<dynamic> login(String email,String password) async{
  String url = '${AppConfig.BASE_URL}/auth/login';
  Map<String,dynamic> requestBody = {
   "email": email,
   "password":password
  };
  try{
  var response =await http.post(Uri.parse(url),body:requestBody ).timeout(
   const Duration(seconds: 10),
  );

  if(response.statusCode ==200){
   if(loginModelFromJson(response.body).message
   !.contains('Successfully')){
    isLogin.$ = true;
    isLogin.save();
    userData.$ = loginModelFromJson(response.body).user!;
    userToken.$ = loginModelFromJson(response.body).accessToken!;
    userToken.save();
    userData.save();
   }
   return loginModelFromJson(response.body);
  }else{
   return errorAuthModelFromJson(response.body).message!;

  }
 } on TimeoutException catch (_) {
 return 'TimeOut';
 } on SocketException catch (_) {
 return 'Check Network';
 }

 }
}