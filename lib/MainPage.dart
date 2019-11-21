import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanandroid_flutter/pages/home/HomePage.dart';
import 'package:wanandroid_flutter/Router.dart';
import 'package:wanandroid_flutter/utils/http/HttpUtils.dart';

void main() {
  runApp(MainPage());
  //初始化dio库
  HttpUtils.init();
  if (Platform.isAndroid) {
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle style =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);

    ///这是设置状态栏的图标和字体的颜色
    ///Brightness.light  一般都是显示为白色
    ///Brightness.dark 一般都是显示为黑色
    /// statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "玩安卓",
      home: new MainStatePage(),
    );
  }
}

class MainStatePage extends StatefulWidget {
  @override
  _MainStatePage createState() => _MainStatePage();
}

class _MainStatePage extends State<MainStatePage> {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);
  var _textBtn = ["首页", "导航体系", "项目", "我"];
  var _imgBtn = [
    [Image.asset('imgs/home_no.png'), Image.asset('imgs/home_yes.png')],
    [Image.asset('imgs/tree_no.png'), Image.asset('imgs/tree_yes.png')],
    [Image.asset('imgs/project_no.png'), Image.asset('imgs/project_yes.png')],
    [Image.asset('imgs/user_no.png'), Image.asset('imgs/user_yes.png')]
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return new Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(
            "首页",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: ImageIcon(AssetImage(
                'imgs/search.png',
              )),
              color: Color.fromRGBO(68, 68, 68, 1.0),
              onPressed: () {
                Router.pushNoParams(context, Router.searchPage);
              },
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: new PageView.builder(
          onPageChanged: _pageChange,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return new HomePage();
              case 1:
                return new Text("我是第" + index.toString() + "页");
              case 2:
                return new Text("我是第" + index.toString() + "页");
              case 3:
                return new Text("我是第" + index.toString() + "页");
            }
          },
          itemCount: 4,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: changeIconButton(0),
                onPressed: () {
                  onTap(0);
                },
                padding: new EdgeInsets.all(10.0),
              ),
              IconButton(
                icon: changeIconButton(1),
                onPressed: () {
                  onTap(1);
                },
                padding: new EdgeInsets.all(10.0),
              ),
              IconButton(
                icon: changeIconButton(2),
                onPressed: () {
                  onTap(2);
                },
                padding: new EdgeInsets.all(10.0),
              ),
              IconButton(
                icon: changeIconButton(3),
                onPressed: () {
                  onTap(3);
                },
                padding: new EdgeInsets.all(10.0),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ));
  }

  Image changeIconButton(int currentIndex) {
    if (currentIndex == _currentPageIndex) {
      //当前选中
      return _imgBtn[currentIndex][1];
    } else {
      //恢复状态
      return _imgBtn[currentIndex][0];
    }
  }

  void onTap(int index) {
    // 过pageview的pagecontroller的animateToPage方法可以跳转
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _pageChange(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }
}
