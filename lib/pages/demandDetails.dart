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
      appBar: AppBar(
        title: Text('Demand '),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
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

                  const SizedBox(height: 30.0),
                  Text("Max budget".toUpperCase(), style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0
                  ),),
                  const SizedBox(height: 10.0),
                  Text(widget.snapshot.data['max_budget'].toString()+" DH", textAlign: TextAlign.justify, style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0
                  ),),
                  const SizedBox(height: 30.0),
                  Text("Contact".toUpperCase(), style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0
                  ),),
                  const SizedBox(height: 10.0),
                  Text(widget.snapshot.data['user']['email'], textAlign: TextAlign.justify, style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0
                  ),),
                  Text(widget.snapshot.data['phone'].toString(), textAlign: TextAlign.justify, style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0
                  ),),
                  const SizedBox(height: 30.0),
                  Text("City".toUpperCase(), style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0
                  ),),
                  const SizedBox(height: 10.0),
                  Text(widget.snapshot.data['city'], textAlign: TextAlign.justify, style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0
                  ),),
                  const SizedBox(height: 30.0),
                  Text("Description".toUpperCase(), style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0
                  ),),
                  const SizedBox(height: 10.0),
                  Text(widget.snapshot.data['description'], textAlign: TextAlign.justify, style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0
                  ),),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}