import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
              child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                clipBehavior: Clip.antiAlias,
                //z轴的高度，设置card的阴影
                elevation: 4.0,
                semanticContainer: false,
                child: getBannerImg(),
              );
            },
            itemCount: 3,
            autoplay: true,
            //如果不填写则不显示指示器
            //pagination: new SwiperPagination(),
            //如果不填则不显示左右切换箭头
            //control: new SwiperControl(),
          )),
        ],
      ),
    );
  }

  getBannerImg() {
    return new Image.network(
      "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
      fit: BoxFit.fitWidth,
      height: 150,
    );
  }
}
