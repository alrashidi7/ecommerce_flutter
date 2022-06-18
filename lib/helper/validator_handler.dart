mixin InputValidationMixin {

  bool isPasswordValid(String password) => password.length >= 6;

  bool isUsernameValid(String name) {
    if(name.length>4){
      return true;
    }else{
      return false;
    }
  }

  bool isPhoneValid(String phoneNUmber) {
    if(phoneNUmber.length==11){
      return true;
    }else{
      return false;
    }
  }

  bool isEmailValid(String email) {
    if(email.contains('@') && email.contains('.')){
      return true;
    }else{
      return false;
    }

  }
}