import 'package:flutter/material.dart';
import './pages/timeboards_page.dart';
import './pages/statistics_page.dart';
import './pages/profile_page.dart';
import './pages/settings_page.dart';

final TextStyle navBarItemTitleStyle = new TextStyle(color: Colors.black);

void main() {
  runApp(new MaterialApp(
    home: new MTabView()
  ));
}

class MTabView extends StatefulWidget {
  @override
  _MTabViewState createState() => new _MTabViewState();
}

class _MTabViewState extends State<MTabView> with SingleTickerProviderStateMixin {
   
   int _currentIndex = 0;

   //TODO: Icons ersetzen
   final _navBarItems = <BottomNavigationBarItem>[
           new BottomNavigationBarItem(icon: new Icon(Icons.donut_large), title: new Text("TimeBoards", style: navBarItemTitleStyle)),
           new BottomNavigationBarItem(icon: new Icon(Icons.equalizer), title: new Text("Statistics", style: navBarItemTitleStyle)),
           new BottomNavigationBarItem(icon: new Icon(Icons.account_circle), title: new Text("Profile", style: navBarItemTitleStyle)),
           new BottomNavigationBarItem(icon: new Icon(Icons.settings), title: new Text("Settings", style: navBarItemTitleStyle)),
         ];
   
   @override
   Widget build(BuildContext context) {
     return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Offstage(
              offstage: _currentIndex != 0,
              child: new TickerMode(
                enabled: _currentIndex == 0,
                child: new MaterialApp(home: new TimeBoardPage()),
              ),
            ),
            new Offstage(
              offstage: _currentIndex != 1,
              child: new TickerMode(
                enabled: _currentIndex == 1,
                child: new MaterialApp(home: new StatisticsPage()),
              ),
            ),
            new Offstage(
              offstage: _currentIndex != 2,
              child: new TickerMode(
                enabled: _currentIndex == 2,
                child: new MaterialApp(home: new ProfilePage()),
              ),
            ),
            new Offstage(
              offstage: _currentIndex != 3,
              child: new TickerMode(
                enabled: _currentIndex == 3,
                child: new MaterialApp(home: new SettingsPage()),
              ),
            ),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: _navBarItems,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) { setState((){ this._currentIndex = index; }); },
        )
     );
   }
}