import 'package:dio/dio.dart';
import 'package:wanandroid_flutter/utils/http/HttpCallBack.dart';
import 'package:wanandroid_flutter/utils/http/HttpURL.dart';
import 'package:wanandroid_flutter/utils/http/HttpUtils.dart';

class HttpApi {
  static getHotKey(Function onSuccess, Function onFailed) {
    Future<Response> res =
        httpUtils.getInstance().get(HttpURL.BASE_URL + HttpURL.HOT_KEY);
    if (res != null) {

    } else {
    }
  }

  //首页轮播Banner
  static getBanner(HttpCallback callback) {
    Future<Response> res =
        httpUtils.getInstance().get(HttpURL.BASE_URL + HttpURL.HOME_IMG_BANNER);
    if (res != null) {
      callback.onSuccess(res);
    } else {
      callback.onFailed();
    }
  }
}
