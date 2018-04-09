import 'package:flutter/material.dart';
import '../components/timeboard.dart';
import '../utils/timeboard_data.dart';

class TimeBoardPage extends StatefulWidget {
  @override
  _TimeBoardPageState createState() => new _TimeBoardPageState();
}

class _TimeBoardPageState extends State<TimeBoardPage> with SingleTickerProviderStateMixin {
  
  //TODO: Liste mit Firebase synchronisieren
  List<TimeBoardData> tbData =  [new TimeBoardData("title1", "unit", 100, 36, false),
                                new TimeBoardData("title2", "unit", 100, 50, false),
                                new TimeBoardData("title3", "unit", 100, 87, false)];

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
            onPressed: () {print("Plus");}, //TODO: "Neues Timeboard" implementieren
          )
        ],
      ),
      body: new ListView.builder(
        itemBuilder: (context, index) => new TimeBoard(tbData[index]),
        itemCount: tbData.length,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
      )
    );
  }
}