import 'package:wanandroid_flutter/base/base_view.dart';
import 'package:wanandroid_flutter/bean/banner.dart';
import 'package:wanandroid_flutter/pages/home/home_presenter.dart';

abstract class HomeView implements BaseView<HomePresenter> {
  void setBannerImg(List<BannerEntity> banner);
}
