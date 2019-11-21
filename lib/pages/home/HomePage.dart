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
              return new Image.network(
                "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
                fit: BoxFit.fitWidth,
              );
            },
            itemCount: 3,
            autoplay: true,
            pagination: new SwiperPagination(),
            control: new SwiperControl(),
          )),
          new Text(
            "sd"
          )
        ],
      ),
    );
  }
}
