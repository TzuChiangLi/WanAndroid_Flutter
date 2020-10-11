import 'package:wanandroid_flutter/base/base_presenter.dart';

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
