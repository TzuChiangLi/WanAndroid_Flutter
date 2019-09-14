//路由表页

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/pages/home/home.dart';
import 'package:wanandroid_flutter/pages/search/search.dart';

class Router {
  static const homePage = "app://";
  static const searchPage = "app://SearchPage";

  Widget _getPage(String url) {
    switch (url) {
      case homePage:
        return HomePage();
      case searchPage:
      default:
        return null;
    }
  }
}
