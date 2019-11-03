import 'package:dio/dio.dart';
import 'package:wanandroid_flutter/utils/http/HttpCallBack.dart';
import 'package:wanandroid_flutter/utils/http/HttpURL.dart';

class httpUtils {
  static Dio _INSTANCE;
  HttpCallback _callback;

  static Dio getInstance() {
    if (_INSTANCE == null) {
      _INSTANCE = new Dio();
      //设置网址
      _INSTANCE.options.baseUrl = HttpURL.BASE_URL;
      //设置超时
      _INSTANCE.options.connectTimeout = 5 * 1000;
      _INSTANCE.options.receiveTimeout = 3 * 1000;
    }
    return _INSTANCE;
  }

  get(String url, FormData params, Function successCallBack,
      Function errorCallBack) async {
    _requstHttp(url, successCallBack, 'get', params, errorCallBack);
  }

  _requstHttp(String url, Function successCallBack,
      [String method, FormData params, Function errorCallBack]) async {
    Response response;
    if (method == 'get') {
      if (params != null && params.isNotEmpty) {
        response = await dio.get(url, queryParameters: params);
      } else {
        response = await dio.get(url);
      }
    } else if (method == 'post') {
      if (params != null && params.isNotEmpty) {
        response = await dio.post(url, data: params);
      } else {
        response = await dio.post(url);
      }
    }
    String dataStr = json.encode(response.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    if (dataMap == null || dataMap['state'] == 0) {
      _error(
          errorCallBack,
          '错误码：' +
              dataMap['errorCode'].toString() +
              '，' +
              response.data.toString());
    } else if (successCallBack != null) {
      successCallBack(dataMap);
    }
  }

  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }

  //post

  set setCallBack(HttpCallback callback) => _callback = callback;
}
