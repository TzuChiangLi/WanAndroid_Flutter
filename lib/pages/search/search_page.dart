import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/bean/hot_key.dart';
import 'package:wanandroid_flutter/pages/search/search_presenter.dart';
import 'package:wanandroid_flutter/pages/search/search_presenter_impl.dart';
import 'package:wanandroid_flutter/pages/search/search_view.dart';
import 'package:wanandroid_flutter/utils/common/color/color_values.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => new _SearchPage();
}

class _SearchPage extends State<SearchPage> implements SearchView {
  SearchPresenter _mPresenter;
  List<HotKeyData> hotKeys = [];
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    //相当于onCreate，在此处初始化数据
    super.initState();
    if (_mPresenter == null) {
      _mPresenter = SearchPresenterImpl.createPresenter(this);
    }
    _mPresenter.getHotKey();
  }

  @override
  Wrap goSearchResult(String hotKey) {
    // TODO: implement goSearchResult
  }

  @override
  setPresenter(SearchPresenter presenter) {
    // TODO: implement setPresenter
    if (presenter != null) {
      _mPresenter = presenter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsValues.bg_daily_white,
        appBar: AppBar(
          title: new SizedBox(
            height: 32,
            child: TextField(
              controller: controller,
              autofocus: true,
              style: TextStyle(
                fontSize: 14,
              ),
              decoration: InputDecoration(
                //设置高度
                contentPadding: EdgeInsets.fromLTRB(16, 4, 0, 2),
                hintText: "请输入关键字",
                hintMaxLines: 1,
                fillColor: Color.fromARGB(255, 230, 231, 237),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
              ),
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
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: new Text(
                  "热门搜索",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorsValues.text_daily_mode,
                    fontSize: 15,
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: new Wrap(
                  /**
                   * 这里区分一下主轴和纵轴的概念：
                   * 当水平方向的时候，其主轴就是水平，纵轴就是垂直。
                   * 当垂直方向的时候，其主轴就是垂直，纵轴就是水平。
                   */
                  direction: Axis.horizontal,
                  //不设置默认为horizontal
                  alignment: WrapAlignment.start,
                  //沿主轴方向居中，左右外边距marginHorizontal
                  spacing: 9.0,
                  //主轴（水平）方向间距,外边距marginVertical
                  runSpacing: 5.0,
                  //纵轴（垂直）方向间距
                  //todo 获取热搜关键词
                  children: _showHotKey(hotKeys),
                ),
              )
            ],
          ),
        ));
  }

  List<Widget> _showHotKey(List<HotKeyData> hotKeys) {
    List<Widget> children = [];
    for (int i = 0; i < hotKeys.length; i++) {
      children.add(
        new ActionChip(
            onPressed: () {
              setState(() {
                controller.text = controller.text + " " + hotKeys[i].name;
              });
            },
            backgroundColor: ColorsValues.bg_edt_view,
            label: new Text(hotKeys[i].name)),
      );
    }
    return children;
  }

  @override
  void setHotKey(List<HotKeyData> hotKeys) {
    // TODO: implement showHotKey
    setState(() {
      this.hotKeys = hotKeys;
    });
  }
}
