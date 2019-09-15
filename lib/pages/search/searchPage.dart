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
          decoration: InputDecoration(
            hintText: "请输入关键字",
            hintMaxLines: 1,
            fillColor: Color.fromARGB(255, 230, 231, 237),
            filled: true,
            border: InputBorder.none,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Image.asset("imgs/search_btn.png"),
            iconSize: 18,
          ),
        ],
        centerTitle: true,
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
