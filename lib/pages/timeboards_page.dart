import 'package:flutter/material.dart';

class TimeBoardPage extends StatefulWidget {
  @override
  TimeBoardPageState createState() => new TimeBoardPageState();
}

class TimeBoardPageState extends State<TimeBoardPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("TimeBoards", style: new TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            color: Colors.black,
            iconSize: 35.0,
          )
        ],
      ),
      body: new Center(
        child: new Icon(Icons.donut_large, size: 150.0, color: Colors.black)
      )
    );
  }
}