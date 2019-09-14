import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "flutter",
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
    return new Scaffold(
        appBar: AppBar(
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
              onPressed: () {},
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: new PageView.builder(
          onPageChanged: _pageChange,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return new Text("我是第" + index.toString() + "页");
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
