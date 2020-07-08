import 'package:flutter/material.dart';
import 'navigationDrawer.dart';
import 'offers.dart';
import 'demands.dart';
import 'map.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Offers(),
    Map(),
    Demands(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search),
              onPressed:()=>debugPrint("search")
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            title: Text('Offers'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Demands')
          )
        ],
      ),
    );
  }
  _onTap(int index) {
    setState(() {
      _currentIndex=index;
    });

  }

}
