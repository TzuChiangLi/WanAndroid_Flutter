import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
      body: new Center(
        child: new Text("dfdsfs"),
      ),
    );
  }
}
