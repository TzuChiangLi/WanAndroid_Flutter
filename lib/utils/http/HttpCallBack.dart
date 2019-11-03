import 'package:dio/dio.dart';

abstract class HttpCallback {
  //回调成功
  void onSuccess(Future<Response> res);
  //回调失败
  void onFailed();
}
