import 'package:ecommerce_flutter/consts/app_strings.dart';
import 'package:shared_value/shared_value.dart';

final SharedValue<bool> isLogin =
    SharedValue(key: 'is_login',value: false, autosave: true );

final SharedValue<String> localLanguage =
    SharedValue(key: 'local_language',value: englishLang, autosave: true );

final SharedValue<bool> isFirstTime =
    SharedValue(key: 'is_first_time',value: true, autosave: true );
