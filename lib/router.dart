//路由表页
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/pages/home/home_page.dart';
import 'package:wanandroid_flutter/pages/search/search_page.dart';

class router {
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

  router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url);
    }));
  }

  router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url);
    }));
  }
}
