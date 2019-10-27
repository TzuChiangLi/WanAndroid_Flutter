import 'package:dio/dio.dart';
import 'package:wanandroid_flutter/utils/http/httpCallBack.dart';

class httpUtils {
  static Dio _INSTANCE;
  httpCallback _callback;

  static Dio getInstance() {
    if (_INSTANCE == null) {
      _INSTANCE = new Dio();
    }
    return _INSTANCE;
  }

  //get
  Future<Response> get(String url) async {
    Response res = await _INSTANCE.get(url);
    return res;
  }

  //post

  set setCallBack(httpCallback callback) => _callback = callback;
}
