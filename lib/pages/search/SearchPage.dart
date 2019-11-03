import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/pages/search/SearchPresenter.dart';
import 'package:wanandroid_flutter/pages/search/SearchPresenterImpl.dart';
import 'package:wanandroid_flutter/pages/search/SearchView.dart';
import 'package:wanandroid_flutter/utils/common/color/ColorsValues.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() {
    _SearchPage mView = new _SearchPage();
    SearchPresenter _mPresenter = new SearchPresenterImpl(mView);
    _mPresenter.init();
    return mView;
  }
}

class _SearchPage extends State<SearchPage> implements SearchView {
  SearchPresenter _mPresenter;

  @override
  void initState() {
    //相当于onCreate，在此处初始化数据
    super.initState();
    _mPresenter.getHotKey();
  }

  @override
  Wrap goSearchResult(String hotKey) {
    // TODO: implement goSearchResult
  }

  @override
  setPresenter(SearchPresenter presenter) {
    // TODO: implement setPresenter
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsValues.bg_daily_white,
        appBar: AppBar(
          title: TextField(
            autofocus: true,
            style: TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              //设置高度
              contentPadding: EdgeInsets.fromLTRB(16, 6, 0, 6),
              hintText: "请输入关键字",
              hintMaxLines: 1,
              fillColor: Color.fromARGB(255, 230, 231, 237),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: null,
              icon: Image.asset("imgs/search_btn.png"),
              padding: EdgeInsets.fromLTRB(4, 12, 16, 12),
            ),
          ],
          centerTitle: false,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
        ),
        body: new Container(
          padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: new Wrap(
            children: <Widget>[
              new Text(
                "热门搜索",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: ColorsValues.text_daily_mode,
                  fontSize: 15,
                ),
              ),
              new Wrap(
                  //todo 获取热搜关键词

                  )
            ],
          ),
        ));
  }
}
