import 'package:wanandroid_flutter/utils/http/url.dart';
import 'package:wanandroid_flutter/utils/http/http_util.dart';

class HttpApi {
  static getHotKey(Function onSuccess, Function onFailed) {
    HttpUtils.get(HttpURL.HOT_KEY, null, (data) {
      onSuccess(data);
    }, (err) {
      onFailed(err);
    });
  }

//  static getHotKey(Function onSuccess, Function onFailed) {
//    Future<Response> res =
//        httpUtils.getInstance().get(HttpURL.BASE_URL + HttpURL.HOT_KEY);
//    if (res != null) {
//
//    } else {
//    }
//  }

//首页轮播Banner
//  static getBanner(HttpCallback callback) {
//    return HttpUtils.get(HttpURL.HOT_KEY, null, (data) {
//      callback.onSuccess(data);
//    }, (err) {
//      callback.onFailed(err);
//    });
//  }
}
