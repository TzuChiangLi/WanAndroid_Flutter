import 'package:wanandroid_flutter/base/BasePresenter.dart';
import 'package:wanandroid_flutter/utils/http/HttpCallBack.dart';

abstract class SearchPresenter implements BasePresenter {
  /*
   * 获取搜索热词
   */
  void getHotKey();


  /*
   * 搜索此关键词
   */
  void search(String hotKey);
}
