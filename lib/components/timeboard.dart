import 'package:flutter/material.dart';
import '../utils/timeboard_data.dart';

class TimeBoard extends StatefulWidget {

  final TimeBoardData tbData;

  TimeBoard(this.tbData);

  @override
  _TimeBoardState createState() => new _TimeBoardState(this.tbData);

}

class _TimeBoardState extends State<TimeBoard> with SingleTickerProviderStateMixin {
  
  final TimeBoardData tbData;
  bool active = false;

  _TimeBoardState(this.tbData);

  @override
  Widget build(BuildContext context) {
    
    final double percentage = tbData.currentValue / tbData.maxValue * 100;
    final double width = MediaQuery.of(context).size.width * 0.9;
    
    return new Column(
      children: <Widget>[
        new Padding(padding: new EdgeInsets.symmetric(vertical: 7.5)),
        new Row(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.only(left: 36.0)),
            new Expanded(child: new Text(tbData.title, textAlign: TextAlign.left,
                                        style: new TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal))),
            new Expanded(child: new Text(tbData.currentValue.toString()+" / "+tbData.maxValue.toString()+" "+tbData.unit, 
                                        textAlign: TextAlign.right, style: new TextStyle(color: Colors.grey, fontSize: 12.0),)),
            new Padding(padding: new EdgeInsets.only(left: 40.0))
          ],
        ),
        new Padding(padding: new EdgeInsets.symmetric(vertical: 2.0)),
        new Stack(
          children: <Widget>[
            new Container(
              width: width,
              //width: 370,
              height: 35.0,
              decoration: new BoxDecoration(
                color: Colors.grey[300],
                borderRadius: new BorderRadius.all(const Radius.circular(30.0))
              )
            ),
            new Container(
              width: width*percentage/100,
              height: 35.0,
              alignment: const Alignment(1.0, 0.0),
              decoration: new BoxDecoration(
                gradient: new LinearGradient(colors: [Colors.blue[700], Colors.lightBlue[300]]),
                borderRadius: new BorderRadius.all(const Radius.circular(30.0))
              ),
              child: new Padding(padding: new EdgeInsets.only(right: 8.0,), 
                child: new Text(percentage.toInt().toString()+"%", style: new TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),)) 
            ),
            new Container(
              width: width,
              height: 35.0,
              child: new Material(
                    type: MaterialType.transparency,
                    borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                    child: new InkWell(
                      //onTap: () => print("Timebaord tapped"), //ToDO: Start / Stop implementieren
                      onTap: () {setState((){this.active = true;});print("Start");},
                      child: new Row(
                        children: <Widget>[
                          new Padding(padding: new EdgeInsets.only(left: 10.0), 
                            child: new Icon(Icons.play_arrow, color: Colors.white)),
                        ],
                      )
                    )
                  ),
            ),
            new Container(
              width: width,
              height: 35.0,
              alignment: Alignment.centerRight,
              child: new IconButton(
                icon: new Icon(Icons.info, color: Colors.white),
                iconSize: 35.0,
                padding: new EdgeInsets.all(0.0),
                alignment: Alignment.centerRight,
                onPressed: () => print("Info tapped"), //TODO: Detail page implementieren
              )
            ),
            new Offstage(
              offstage: this.active == false,
              child: new Container(
                width: width,
                height: 35.0,
                decoration: new BoxDecoration(
                  color: Colors.green,
                  borderRadius: new BorderRadius.all(const Radius.circular(30.0))
                ),
                child: new Material(
                    type: MaterialType.transparency,
                    borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                    child: new InkWell(
                      onTap: () {setState((){this.active = false;});print("Stop");},
                      child: new Row(
                        children: <Widget>[
                          new Padding(padding: new EdgeInsets.only(left: 10.0), 
                            child: new Icon(Icons.pause, color: Colors.white)),
                        ],
                      )
                    )
                  ),
              ),
            )
          ],
        ),
        new Padding(padding: new EdgeInsets.symmetric(vertical: 7.5))
      ],
    );
  }
}