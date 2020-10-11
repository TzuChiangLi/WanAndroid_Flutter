import 'package:flutter/material.dart';

class ImageButton extends StatefulWidget {
  final String image; //图标
  final Function onPressed; //必须实现的按压
  final String text; //图标底部的文字
  final double width;
  final TextStyle normalStyle;

  const ImageButton(
      {Key key,
      this.image,
      this.onPressed,
      this.text,
      this.width,
      this.normalStyle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImageButtonState();
  }
}

class _ImageButtonState extends State<ImageButton> {
  var isPressed = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Column(
        children: <Widget>[
          widget.image.isEmpty
              ? Container()
              : Image(
                  image: AssetImage(widget.image),
                  width: widget.width,
                  height: widget.width,
                ),
          widget.text.isEmpty
              ? Container()
              : Text(
                  widget.text,
                  style: widget.normalStyle,
                )
        ],
      ),
      onTap: widget.onPressed,
      //点击事件
      onTapDown: (d) {
        //按下
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (d) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
    );
//    return ImageButton(
//      image: Image(
//        image: AssetImage(widget.imgSrc),
//        height: widget.width,
//        width: widget.width,
//      ),
//      text: widget.text == null ? '' : widget.text,
//      //文本是否为空
//      normalStyle: TextStyle(
//          color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
//      onPressed: widget.onPressed,
//    );
  }
}
