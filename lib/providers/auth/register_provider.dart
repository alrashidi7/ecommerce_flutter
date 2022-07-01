import 'package:ecommerce_flutter/data/auth_api/login_api.dart';
import 'package:ecommerce_flutter/models/auth/login_model.dart';
import 'package:ecommerce_flutter/view/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../data/auth_api/register_api.dart';

enum RegisterState { initial, loading, loaded, error }

class RegisterProvider extends ChangeNotifier {
  dynamic registerResoponse;
  RegisterState state = RegisterState.initial;

  register(String email, String password, String phone, String name,BuildContext context) async {
    state = RegisterState.loading;
    notifyListeners();
    await RegisterApi().register(email, password, name, phone).then((value) {
      if (value.runtimeType == String) {
        state = RegisterState.error;
        registerResoponse = value;
      } else {
        state = RegisterState.loaded;
        registerResoponse = value;

        Navigator.push(context, MaterialPageRoute(
            builder: (_) => LoginScreen(hasPreviousPage: true)));
      }
    });
    notifyListeners();
  }
}