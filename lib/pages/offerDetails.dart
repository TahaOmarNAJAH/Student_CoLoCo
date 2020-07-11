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

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
        child: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                 child: new ClipRRect(
                   child: Image.network(widget.snapshot.data['imageURL'] ,fit: BoxFit.fitWidth,),
                 ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.snapshot.data['title'],
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(

                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Description:',
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),

                      Text(widget.snapshot.data['accommodation_address'],style: TextStyle(fontSize: 18),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      )
      )
    );
  }
}