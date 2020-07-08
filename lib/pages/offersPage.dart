import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class OffersPage extends StatefulWidget{
  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  //get all query s from db collection
  StreamSubscription<QuerySnapshot>subscription;
  // to get data from db
  List<DocumentSnapshot>snapshot;
  //create collection in db
  // "collection name"
  CollectionReference collectionReference=Firestore.instance.collection("rentalOffers");

  @override
  void initState() {
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
        title: Text('Offers'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(snapshot.length) // Replace
      ),
    );
  }
  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
          (int index) => Card(

            elevation: 10.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.network(snapshot[index].data['imageURL'] ,fit: BoxFit.cover,),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(snapshot[index].data['title'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.0),
                  Text(snapshot[index].data['price'].toString() +'  DH/Month'),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return cards;
  }
}