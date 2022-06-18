import 'package:ecommerce_flutter/consts/app_assets.dart';
import 'package:ecommerce_flutter/consts/app_config.dart';
import 'package:ecommerce_flutter/view/screens/auth/signup/signup_screen.dart';
import 'package:ecommerce_flutter/view/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce_flutter/view/widgets/buttons/global_button.dart';
import 'package:ecommerce_flutter/view/widgets/textField/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../../consts/app_styles.dart';

class LoginScreen extends StatefulWidget {
  bool hasPreviousPage;

  LoginScreen({Key? key, required this.hasPreviousPage}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: backgroundScaffold,
      body: SafeArea(
        child: Center(
          child: Container(
            width: size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _imageHeader(size),
                SizedBox(
                  height: AppConfig.mediumDimensions,
                ),
                Text(
                  'Login',
                  style: textStyleNormal.copyWith(
                      color: primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w900),
                ),
                _loginForm(size),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_) => SignupScreen(hasPreviousPage: true,)));
                  },
                  child: Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: RichText(text: TextSpan(
                        text: 'you do not have account?!',
                        style: textStyleNormal,
                        children: [
                          TextSpan(text: ' Register',
                            style: textStyleNormal.copyWith(color: accentColor,
                                decoration: TextDecoration.underline),)
                        ])),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageHeader(Size size) {
    return Stack(
      children: [
        Image.asset(
          loginGIF,
          width: size.width,
          height: size.height * 0.33,
          fit: BoxFit.fitHeight,
        ),
        widget.hasPreviousPage ? IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, size: 30,)) : SizedBox()
      ],
    );
  }

  Widget _loginForm(Size size) {
    return Form(
        key: formGlobalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFieldWidget(
                controller: emailController,
                size: size,
                hint: 'Email',
                iconData: Icons.email_outlined),
            SizedBox(
              height: AppConfig.largeDimensions,
            ),
            TextFieldWidget(
                controller: passwordController,
                size: size,
                hint: 'Password',
                iconData: Icons.lock_open_outlined),
            SizedBox(
              height: AppConfig.mediumDimensions,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Password?!',
                  style: textStyleNormal.copyWith(
                      decoration: TextDecoration.underline),
                )),
            SizedBox(
              height: AppConfig.largeDimensions,
            ),

            GlobalButton(backgroundBtnColor:primaryColor,
              btnTextColor: accentColor,
              buttonText: 'Login',
              onPressed: () {
                login();
              },),

            SizedBox(
              height: AppConfig.largeDimensions,
            ),

            GlobalButton(backgroundBtnColor: Colors.white,
              btnTextColor: primaryColor,
              buttonText: 'As Guest',
              onPressed: (){
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (_) => DashboardScreen()), (
                        route) => false);
              },)
          ],
        ));
  }

  login() {

    if (formGlobalKey.currentState!.validate()) {
      // todo login
    } else {
      // todo invalid inputs
    }
  }
}
