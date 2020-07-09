import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class OffertDetails extends StatefulWidget{
  DocumentSnapshot snapshot;
  OffertDetails({this.snapshot});

  @override
  _OffertDetailsState createState() => _OffertDetailsState();
}

class _OffertDetailsState extends State<OffertDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                 child: new ClipRRect(
                   child: Image.network(widget.snapshot.data['imageURL'] ,fit: BoxFit.fitWidth,),
                 ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(widget.snapshot.data['title'],style: TextStyle(fontSize: 30),)
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(widget.snapshot.data['accommodation_address']),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}