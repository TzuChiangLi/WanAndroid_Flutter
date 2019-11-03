import 'package:wanandroid_flutter/pages/search/SearchPresenter.dart';

import 'SearchView.dart';

class SearchPresenterImpl implements SearchPresenter{

  // 这里Presenter需要引入View的实例，来出发View的刷新
  SearchView _view;
  // View的实例也需要引入Presenter的实例引用
  SearchPresenterImpl(this._view) {
    _view.setPresenter(this);
  }

  @override
  init() {
    // TODO: implement init
    return null;
  }
  @override
  void getHotKey() {
    // TODO: implement getHotKey
  }
  @override
  void search(String hotKey) {
    // TODO: implement search
  }

}