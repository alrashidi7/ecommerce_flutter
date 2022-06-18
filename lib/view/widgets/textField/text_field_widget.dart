import 'package:ecommerce_flutter/consts/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../helper/validator_handler.dart';

class TextFieldWidget extends StatefulWidget {
  TextEditingController controller;
  Size size;
  String hint;
  IconData iconData;

  TextFieldWidget(
      {Key? key, required this.controller, required this.size, required this.hint,required this.iconData})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> with InputValidationMixin {
  bool isObscureText = false;

  bool isPassword = false;
  bool isUsername = false;
  bool isPhone = false;
  bool isEmail = false;

  @override
  Widget build(BuildContext context) {
    TextInputType inputType = TextInputType.text;

    switch (widget.hint){
      case 'Password':{
        isPassword = true;
        isObscureText = true;
        inputType = TextInputType.text;
      }break;
      case 'Email': {
        inputType = TextInputType.emailAddress;
        isEmail = true;
      }break;
      case 'Phone Number':{
        isPhone = true;
        inputType = TextInputType.number;
      }break;
      case 'Username':{
        isUsername = true;
        inputType = TextInputType.text;
      }break;

    }

    return Container(
      width: widget.size.width,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black45,width: 1.5)),

      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: inputType,
        validator: (input) {
          if(isEmail){
            if(isEmailValid(input??'')) {
              return null;
            } else {
              return 'Enter a valid email address';
            }
          }
          else if(isPassword){
            if(isPasswordValid(input??'')) {
              return null;
            } else {
              return 'Enter a valid password';
            }
          }else if(isPhone){
            if(isPhoneValid(input??'')) {
              return null;
            } else {
              return 'Enter a valid Phone number';
            }
          }else if(isUsername){
            if(isUsernameValid(input??'')) {
              return null;
            } else {
              return 'Enter a valid Username';
            }
          }

        },
          obscureText:isObscureText,

        decoration: InputDecoration(
          border: InputBorder.none,

          prefixIcon: Icon(widget.iconData),
          hintText: widget.hint,
          hintStyle: textStyleHint,
          suffixIcon:isPassword?

          GestureDetector(
            onTap: (){
              setState(() {
              isObscureText = !isObscureText;
            });
            },

            child: !isObscureText?
            FaIcon(FontAwesomeIcons.eyeSlash,size: 20,)
                :
            FaIcon(FontAwesomeIcons.eye,size: 20,),
          )
              :
          SizedBox()

        ),
      ),
    );
  }

}
