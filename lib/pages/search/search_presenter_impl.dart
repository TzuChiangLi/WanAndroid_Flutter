import 'dart:convert';

import 'package:wanandroid_flutter/bean/hot_key.dart';
import 'package:wanandroid_flutter/pages/search/search_presenter.dart';
import 'package:wanandroid_flutter/utils/http/http_api.dart';

import 'search_view.dart';

class SearchPresenterImpl implements SearchPresenter {
  // 这里Presenter需要引入View的实例，来出发View的刷新
  SearchView _view;

  // View的实例也需要引入Presenter的实例引用
  SearchPresenterImpl(this._view) {
    _view.setPresenter(this);
  }

  static SearchPresenterImpl createPresenter(SearchView mView) {
    return new SearchPresenterImpl(mView);
  }

  @override
  init() {
    // TODO: implement init
    return null;
  }

  @override
  void getHotKey() {
    HttpApi.getHotKey((data) {
      if (data != null) {
        print("success" + data.toString());
        //todo 处理数据,传递过来的是json字符串
        List responseJson = json.decode(data);
        List<HotKeyData> hotKeyList =
            responseJson.map((m) => new HotKeyData.fromJson(m)).toList();
        _view.setHotKey(hotKeyList);
//        List<HotKeyData> result = new List<HotKeyData>.from(data).cast<HotKeyData>();
//        _view.setHotKey(result);
//        _view.setHotKey();
      }
    }, (err) {
      print("failed");
    });
  }

  @override
  void search(String hotKey) {
    // TODO: implement search
  }
}
