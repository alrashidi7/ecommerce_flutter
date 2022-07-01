import 'package:ecommerce_flutter/data/auth_api/login_api.dart';
import 'package:ecommerce_flutter/models/auth/login_model.dart';
import 'package:ecommerce_flutter/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

enum LoginState { initial, loading, loaded, error }

class LoginProvider extends ChangeNotifier {
  dynamic loginResponse;
  LoginState state = LoginState.initial;

  login(String email, String password, BuildContext context) async {
    state = LoginState.loading;
    notifyListeners();
    await LoginApi().login(email, password).then((value) {
      if (value.runtimeType == String) {
        state = LoginState.error;
        loginResponse = value;
      } else {
        state = LoginState.loaded;
        loginResponse = value;
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) => DashboardScreen()), (
            route) => false);
      }
    });

    notifyListeners();
  }
}
