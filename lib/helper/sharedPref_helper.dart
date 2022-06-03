import 'package:shared_value/shared_value.dart';

final SharedValue<bool> isLogin =
    SharedValue(key: 'is_login',value: false, autosave: true );
