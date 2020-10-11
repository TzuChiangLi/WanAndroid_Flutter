import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/base/BaseView.dart';
import 'package:wanandroid_flutter/bean/HotKey.dart';
import 'package:wanandroid_flutter/pages/search/search_presenter.dart';

abstract class SearchView implements BaseView<SearchPresenter> {
  void setHotKey(List<HotKeyData> hotKeys);

  Wrap goSearchResult(String hotKey);
}
