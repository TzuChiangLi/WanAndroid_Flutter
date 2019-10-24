import 'package:dio/dio.dart';

class httpUtils {
  static Dio _INSTANCE;

  static Dio getInstance() {
    if (_INSTANCE == null) {
      _INSTANCE = new Dio();
    }
    return _INSTANCE;
  }


}
