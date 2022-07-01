import 'package:ecommerce_flutter/consts/app_strings.dart';
import 'package:ecommerce_flutter/models/auth/login_model.dart';
import 'package:shared_value/shared_value.dart';

final SharedValue<bool> isLogin =
    SharedValue(key: 'is_login',value: false, autosave: true );

final SharedValue<String> localLanguage =
    SharedValue(key: 'local_language',value: englishLang, autosave: true );

final SharedValue<bool> isFirstTime =
    SharedValue(key: 'is_first_time',value: true, autosave: true );
final SharedValue<User> userData =
    SharedValue(value: User(),key: 'user_data',autosave: true);
final SharedValue<String> userToken =
    SharedValue(value: '',key: 'user_token',autosave: true);
