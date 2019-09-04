import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "flutter",
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            "首页",
            style: TextStyle(color: Colors.black),
          ),

          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: ImageIcon(AssetImage('imgs/search.png',)),
              color: Color.fromRGBO(68, 68, 68, 1.0),
              onPressed: (){},
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text("sdfdsf"),
              Text("sdfsdf"),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Image.asset('imgs/home.png'),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('imgs/tree.png'),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('imgs/project_yes.png'),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('imgs/user.png'),
                onPressed: () {},
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ));
  }
}
