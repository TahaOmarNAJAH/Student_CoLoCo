import 'package:flutter/material.dart';

class DemandsPage extends StatefulWidget{
  @override
  _DemandsPageState createState() => _DemandsPageState();
}

class _DemandsPageState extends State<DemandsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demands Page'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            demand(),
            demand(),
            demand(),
            demand()
          ],
        ),
      )
    );
  }


Padding demand() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 150,
      child: Card(

        elevation: 1,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Lorem ipsum',style: TextStyle(fontFamily: 'nunito',fontSize: 20,fontWeight: FontWeight.w700),),
                  Icon(Icons.more_horiz,size: 20.0,color: Colors.black,)
                ],
              ),
              Text('Lorem ipsum dolor sit amet, consectetur.',style: TextStyle(fontSize: 18,fontFamily: 'nunito'),),
              Text('07,Mar at 15:30 pm',style: TextStyle(fontSize: 15),),



            ],
          ),
        ),
      ),
    ),
  );
}
}