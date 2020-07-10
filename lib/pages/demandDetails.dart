import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class DemandDetails extends StatefulWidget{
  DocumentSnapshot snapshot;
  DemandDetails({this.snapshot});

  @override
  _DemandDetailsState createState() => _DemandDetailsState();
}

class _DemandDetailsState extends State<DemandDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(widget.snapshot.data['title'],
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.snapshot.data['description'],style: TextStyle(fontSize: 18),)
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}