import 'dart:async';
import 'dart:io';

import 'package:ecommerce_flutter/consts/app_config.dart';
import 'package:ecommerce_flutter/helper/sharedPref_helper.dart';
import 'package:ecommerce_flutter/models/auth/error_auth_model.dart';
import 'package:ecommerce_flutter/models/auth/login_model.dart';
import 'package:ecommerce_flutter/models/auth/register_model.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  Future<dynamic> register(String email, String password, String name,
      String phone) async {
    String url = '${AppConfig.BASE_URL}/auth/signup';

    Map<String,dynamic> requestHeader = {
      "Content-Type": "application/json",
      "App-Language": 'en',
    };

    Map<String, dynamic> requestBody =
    {
    "name": "$name",
    "email_or_phone": "$email",
    "phoneNo": "$phone",
    "register_by": "email",
    "password": "$password"};
    try {
      var response = await http.post(Uri.parse(url), body: requestBody).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        if (signupModelFromJson(response.body)
            .message!
            .contains('Successful')) {

          return signupModelFromJson(response.body);
        }else{
          return errorAuthModelFromJson(response.body).message!;
        }
      } else {
        return errorAuthModelFromJson(response.body).message!;
      }
    } on TimeoutException catch (_) {
      return 'TimeOut';
    } on SocketException catch (_) {
      return 'Check Network';
    }
  }}
