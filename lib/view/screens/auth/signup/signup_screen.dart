import 'package:ecommerce_flutter/consts/app_assets.dart';
import 'package:ecommerce_flutter/providers/auth/register_provider.dart';
import 'package:ecommerce_flutter/view/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../consts/app_config.dart';
import '../../../../consts/app_styles.dart';
import '../../../widgets/buttons/global_button.dart';
import '../../../widgets/snack_bar.dart';
import '../../../widgets/textField/text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  bool hasPreviousPage;

  SignupScreen({Key? key, required this.hasPreviousPage}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RegisterProvider registerProvider = Provider.of<RegisterProvider>(context);

    return Scaffold(
      backgroundColor: backgroundScaffold,
      key: scaffoldKey,
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
                registerProvider.state == RegisterState.error
                    ? Center(
                        child: Text(
                          registerProvider.registerResoponse,
                          style: textStyleNormal,
                        ),
                      )
                    : _registerForm(size, registerProvider),
                SizedBox(
                  height: AppConfig.mediumDimensions,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => LoginScreen(
                                  hasPreviousPage: true,
                                )));
                  },
                  child: Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                            text: 'you already have account?! ',
                            style: textStyleNormal,
                            children: [
                          TextSpan(
                            text: 'Login',
                            style: textStyleNormal.copyWith(
                                color: accentColor,
                                decoration: TextDecoration.underline),
                          )
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
        widget.hasPreviousPage
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                ))
            : SizedBox()
      ],
    );
  }

  Widget _registerForm(Size size, RegisterProvider registerProvider) {
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
            registerProvider.state == RegisterState.loading
                ? const Center(child: CircularProgressIndicator())
                : GlobalButton(
                    backgroundBtnColor: primaryColor,
                    btnTextColor: accentColor,
                    buttonText: 'Register',
                    onPressed: () {
                      register(registerProvider,context);
                    },
                  ),
          ],
        ));
  }

  register(RegisterProvider registerProvider,BuildContext context) {
    if (formGlobalKey.currentState!.validate()) {
      registerProvider.register(emailController.text, passwordController.text,
          phoneController.text, nameController.text,context);
    } else {
      showInSnackBar(scaffoldKey, 'Please Enter a valid data', true);
    }
  }
}
