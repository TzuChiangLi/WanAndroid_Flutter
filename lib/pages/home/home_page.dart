import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanandroid_flutter/bean/banner.dart';
import 'package:wanandroid_flutter/pages/home/home_view.dart';
import 'package:wanandroid_flutter/views/image_btn.dart';

import 'home_presenter.dart';
import 'home_presenter_impl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> implements HomeView {
  List<BannerEntity> _banner;
  HomePresenter _mPresenter;

  @override
  void initState() {
    // TODO: implement initState
    if (_mPresenter == null) {
      _mPresenter = HomePresenterImpl.createPresenter(this);
    }
    _mPresenter.getBannerImg();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: new Column(
        children: <Widget>[
          new Container(
            height: 180,
            child: new Expanded(
              child: new Card(
                //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                clipBehavior: Clip.antiAlias,
                //z轴的高度，设置card的阴影
                elevation: 4.0,
                semanticContainer: false,
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(_banner[index].imagePath,
                        fit: BoxFit.fitWidth, height: 180);
                  },
                  itemCount: 3,
                  autoplay: true,
                  //如果不填写则不显示指示器
                  //pagination: new SwiperPagination(),
                  //如果不填则不显示左右切换箭头
                  //control: new SwiperControl(),
                ),
              ),
            ),
          ),
          new Container(
            padding: EdgeInsets.fromLTRB(16, 12, 12, 16),
            child: new Row(
              //均分布局
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new ImageButton(
                  image: "imgs/home_nav.png",
                  text: '导航',
                  width: 32,
                  onPressed: null,
                ),
                new ImageButton(
                  image: "imgs/home_article.png",
                  text: '文章',
                  width: 32,
                  onPressed: null,
                ),
                new ImageButton(
                  image: "imgs/home_project.png",
                  text: '项目',
                  width: 32,
                  onPressed: null,
                ),
                new ImageButton(
                  image: "imgs/home_official_account.png",
                  text: '公众号',
                  width: 32,
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void setBannerImg(List<BannerEntity> banner) {
    // TODO: implement setBannerImg
    setState(() {
      this._banner = banner;
    });
  }

  @override
  setPresenter(HomePresenter presenter) {
    // TODO: implement setPresenter
  }
}
