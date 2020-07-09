import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DemandsPage extends StatefulWidget{
  @override
  _DemandsPageState createState() => _DemandsPageState();
}

class _DemandsPageState extends State<DemandsPage> {
  StreamSubscription<QuerySnapshot>subscription;
  List<DocumentSnapshot>snapshot;
  CollectionReference collectionReference=Firestore.instance.collection("retalDemandes");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription=collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot=datasnapshot.documents;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demands Page'),
        backgroundColor: Colors.orangeAccent,
      ),
      body:Container(
        child: ListView.builder(
            itemCount:snapshot.length ,
            itemBuilder: (BuildContext context,int index)=>buildCard(context,index)
        ),
      ) ,
    );
  }

  Widget buildCard(BuildContext context,int index){
    return Container(
      child: Padding(
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
                      Text(snapshot[index].data['title'],style: TextStyle(fontFamily: 'nunito',fontSize: 20,fontWeight: FontWeight.w700),),
                      Icon(Icons.more_horiz,size: 20.0,color: Colors.black,)
                    ],
                  ),
                  Text(snapshot[index].data['description'],style: TextStyle(fontSize: 18,fontFamily: 'nunito'),),
                  Text(snapshot[index].data['max_budget'].toString(),style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

}