import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/base/BaseView.dart';
import 'package:wanandroid_flutter/pages/search/SearchPresenter.dart';

abstract class SearchView implements BaseView<SearchPresenter> {
  Wrap goSearchResult(String hotKey);
}
