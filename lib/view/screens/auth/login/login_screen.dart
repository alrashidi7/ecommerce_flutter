import 'package:ecommerce_flutter/consts/app_assets.dart';
import 'package:ecommerce_flutter/consts/app_config.dart';
import 'package:ecommerce_flutter/data/auth_api/login_api.dart';
import 'package:ecommerce_flutter/models/auth/login_model.dart';
import 'package:ecommerce_flutter/providers/auth/login_provider.dart';
import 'package:ecommerce_flutter/view/screens/auth/signup/signup_screen.dart';
import 'package:ecommerce_flutter/view/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce_flutter/view/widgets/buttons/global_button.dart';
import 'package:ecommerce_flutter/view/widgets/snack_bar.dart';
import 'package:ecommerce_flutter/view/widgets/textField/text_field_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../consts/app_styles.dart';

class LoginScreen extends StatelessWidget {
  bool hasPreviousPage;

  LoginScreen({Key? key, required this.hasPreviousPage}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<LoginModel>? loginResponse;

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundScaffold,
      body: SafeArea(
        child: Center(
          child: Container(
            width: size.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _imageHeader(size, context),
                  const SizedBox(
                    height: AppConfig.mediumDimensions,
                  ),
                  Text(
                    'Login',
                    style: textStyleNormal.copyWith(
                        color: primaryColor,
                        fontSize: 35,
                        fontWeight: FontWeight.w900),
                  ),
                  // value.isLoading? Center(child: CircularProgressIndicator()) :

                   _loginForm(size, loginProvider, context),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SignupScreen(
                                    hasPreviousPage: true,
                                  )));
                    },
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: RichText(
                          text: TextSpan(
                              text: 'you do not have account?!',
                              style: textStyleNormal,
                              children: [
                            TextSpan(
                              text: ' Register',
                              style: textStyleNormal.copyWith(
                                  color: accentColor,
                                  decoration: TextDecoration.underline),
                            )
                          ])),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageHeader(Size size, BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          loginGIF,
          width: size.width,
          height: size.height * 0.33,
          fit: BoxFit.fitHeight,
        ),
        hasPreviousPage
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ))
            : const SizedBox()
      ],
    );
  }

  Widget _loginForm(
      Size size, LoginProvider loginProvider, BuildContext context) {
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
            const SizedBox(
              height: AppConfig.largeDimensions,
            ),
            TextFieldWidget(
                controller: passwordController,
                size: size,
                hint: 'Password',
                iconData: Icons.lock_open_outlined),
            const SizedBox(
              height: AppConfig.mediumDimensions,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Password?!',
                  style: textStyleNormal.copyWith(
                      decoration: TextDecoration.underline),
                )),
            const SizedBox(
              height: AppConfig.largeDimensions,
            ),

            loginProvider.state == LoginState.loading
                ? const Center(child: CircularProgressIndicator())
                : GlobalButton(
                    backgroundBtnColor: primaryColor,
                    btnTextColor: accentColor,
                    buttonText: 'Login',
                    onPressed: () {
                       login(loginProvider,context);
                    },
                  ),

            // FutureBuilder(
            //   future: loginResponse,
            //     builder: (BuildContext context,
            //     AsyncSnapshot<LoginModel>snapshot) {
            //   switch (snapshot.connectionState) {
            //     case ConnectionState.waiting:
            //       {
            //         return const CircularProgressIndicator();
            //       }
            //     default:
            //         if (snapshot.hasError) {
            //           WidgetsBinding.instance!
            //               .addPostFrameCallback((_) {
            //             //valueNotifier.value = _pcm; //provider
            //             //setState
            //             showInSnackBar(scaffoldKey,
            //                 snapshot.error.toString(), true);
            //           });
            //           return Center(
            //               child: Text('Error: ${snapshot.error}'));
            //
            //       } else{
            //
            //          return  GlobalButton(backgroundBtnColor: primaryColor,
            //            btnTextColor: accentColor,
            //            buttonText: 'Login',
            //            onPressed: () {
            //              login();
            //            },);
            //        }
            //   }
            // }),

            const SizedBox(
              height: AppConfig.largeDimensions,
            ),

            GlobalButton(
              backgroundBtnColor: Colors.white,
              btnTextColor: primaryColor,
              buttonText: 'As Guest',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen()),
                    (route) => false);
              },
            )
          ],
        ));
  }

  login(LoginProvider provider,BuildContext context) {

    if (formGlobalKey.currentState!.validate()) {
      provider.login(emailController.text, passwordController.text,context);

    } else {
      showInSnackBar(scaffoldKey, 'Please Enter a valid data', true);
    }

  }
}
