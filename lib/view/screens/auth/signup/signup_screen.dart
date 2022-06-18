import 'package:ecommerce_flutter/consts/app_assets.dart';
import 'package:ecommerce_flutter/view/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../../consts/app_config.dart';
import '../../../../consts/app_styles.dart';
import '../../../widgets/textField/text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  bool hasPreviousPage ;
  SignupScreen({Key? key,required this.hasPreviousPage}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  height: AppConfig.largeDimensions,
                ),
                Text(
                  'Sign up',
                  style: textStyleNormal.copyWith(
                      color: primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w900),
                ),
                _registerForm(size),
                SizedBox(
                  height: AppConfig.mediumDimensions,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginScreen(hasPreviousPage: true,)));
                  },
                  child: Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: RichText(text: TextSpan(
                        text: 'you already have account?! ',
                        style: textStyleNormal,
                        children: [
                          TextSpan(text: 'Login',
                            style: textStyleNormal.copyWith(color: accentColor,decoration: TextDecoration.underline),)
                        ])),
                  ),
                ),
                SizedBox(
                  height: AppConfig.mediumDimensions,
                ),
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
          signupGIF,
          width: size.width,
          height: size.height * 0.3,
          fit: BoxFit.fitHeight,
        ),
        widget.hasPreviousPage?IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,size: 30,)):SizedBox()
      ],
    );
  }

  Widget _registerForm(Size size) {
    return Form(
        key: formGlobalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFieldWidget(
                controller: nameController,
                size: size,
                hint: 'Username',
                iconData: Icons.person_outline),
            SizedBox(
              height: AppConfig.mediumDimensions,
            ),
            TextFieldWidget(
                controller: emailController,
                size: size,
                hint: 'Email',
                iconData: Icons.email_outlined),
            SizedBox(
              height: AppConfig.mediumDimensions,
            ),
            TextFieldWidget(
                controller: phoneController,
                size: size,
                hint: 'Phone',
                iconData: Icons.phone_outlined),
            SizedBox(
              height: AppConfig.mediumDimensions,
            ),
            TextFieldWidget(
                controller: passwordController,
                size: size,
                hint: 'Password',
                iconData: Icons.lock_open_outlined),

            SizedBox(
              height: AppConfig.veryLargeDimensions,
            ),
            GestureDetector(
              onTap: () {
                register();
              },
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                    BorderRadius.circular(AppConfig.largeDimensions)),
                child: Center(
                  child: Text('Register',
                      style: textStyleNormal.copyWith(color: accentColor,fontSize: 20)),
                ),
              ),
            )
          ],
        ));
  }

  register(){
    if (formGlobalKey.currentState!.validate()) {
      // todo register
    }else{

    }
  }
}
