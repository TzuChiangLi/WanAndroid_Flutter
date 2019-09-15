//路由表页
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/pages/home/homePage.dart';
import 'package:wanandroid_flutter/pages/search/searchPage.dart';

class Router {
  static const homePage = "app://";
  static const searchPage = "app://SearchPage";

  Widget _getPage(String url) {
    switch (url) {
      case homePage:
        return HomePage();
      case searchPage:
        return SearchPage();
        break;
      default:
        return null;
    }
  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url);
    }));
  }
}
