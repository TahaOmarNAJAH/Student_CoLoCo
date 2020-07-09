import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:test_app/pages/offerDetails.dart';

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
        title: Text('Offers'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
             scrollDirection: Axis.horizontal,
            itemCount: snapshot.length,
            itemBuilder: (context,index){
              return null;
            }),
      ),

    );
  }
}