import 'package:dio/dio.dart';
import 'package:wanandroid_flutter/utils/http/HttpCallBack.dart';
import 'package:wanandroid_flutter/utils/http/HttpURL.dart';
import 'package:wanandroid_flutter/utils/http/HttpUtils.dart';

class httpApi {
  //首页轮播Banner
  static getBanner(httpCallback callback){
    Future<Response> res = httpUtils.getInstance().get(httpURL.BASE_URL+httpURL.HOME_IMG_BANNER);
    if(res!=null){
      callback.onSuccess(res);
    }else{
      callback.onFailed();
    }
  }
}