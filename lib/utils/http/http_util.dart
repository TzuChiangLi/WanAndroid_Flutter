import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wanandroid_flutter/utils/http/url.dart';
import 'package:wanandroid_flutter/utils/http/res.dart';

class HttpUtils {
  static Dio _instance;

  static void init() {
    if (_instance == null) {
      _instance = new Dio();
      //设置网址
      _instance.options.baseUrl = HttpURL.BASE_URL;
      //设置超时
      _instance.options.connectTimeout = 5 * 1000;
      _instance.options.receiveTimeout = 3 * 1000;
    }
  }

  static get(String url, Map<String, dynamic> params, Function onSuccess,
      Function onFailed) async {
    _requstHttp(url, onSuccess, 'get', params, onFailed);
  }

  static _requstHttp(String url, Function onSuccess,
      [String method, Map<String, dynamic> params, Function onFailed]) async {
    Response response;
    if (method == 'get') {
      //get方法
      if (params != null && params.isNotEmpty) {
        response = await _instance.get(url, queryParameters: params);
      } else {
        response = await _instance.get(url);
      }
    } else if (method == 'post') {
      //post方法
      if (params != null && params.isNotEmpty) {
        response = await _instance.post(url, data: params);
      } else {
        response = await _instance.post(url);
      }
    }
    String dataStr = json.encode(response.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    if (dataMap == null || dataMap['errorCode'] != 0) {
      _error(
          onFailed,
          '错误码：' +
              dataMap['errorCode'].toString() +
              '，' +
              response.data.toString());
    } else if (onSuccess != null) {
      ResBean res = ResBean.fromJson(json.decode(dataStr));
      onSuccess(jsonEncode(res.data));
    }
  }

  static _error(Function onFailed, String error) {
    if (onFailed != null) {
      onFailed(error);
    }
  }
}
