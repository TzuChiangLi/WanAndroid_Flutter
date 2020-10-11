import 'package:wanandroid_flutter/pages/home/home_presenter.dart';
import 'package:wanandroid_flutter/pages/home/home_view.dart';
import 'package:wanandroid_flutter/utils/http/http_api.dart';
import 'dart:convert';
import 'package:wanandroid_flutter/bean/banner.dart';

class HomePresenterImpl extends HomePresenter {
  // 这里Presenter需要引入View的实例，来出发View的刷新
  HomeView _view;

  // View的实例也需要引入Presenter的实例引用
  HomePresenterImpl(this._view) {
    _view.setPresenter(this);
  }

  static HomePresenterImpl createPresenter(HomeView mView) {
    return new HomePresenterImpl(mView);
  }

  @override
  void getBannerImg() {
    // TODO: implement getBannerImg
    HttpApi.getBanner((data) {
      if (data != null) {
        print("success" + data.toString());
        List resJson = json.decode(data);
        List<BannerEntity> res =
            resJson.map((m) => new BannerEntity.fromJson(m)).toList();
        _view.setBannerImg(res);
      }
    }, (err) {});
  }

  @override
  init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}
