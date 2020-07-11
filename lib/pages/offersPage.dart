import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/pages/offer_details.dart';
import 'dart:async';
import 'offerForm.dart';

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

  passData(DocumentSnapshot snap){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>OfferDetailsPage(snapshot: snap,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers'),
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: Icon(
          Icons.add,color: Colors.white,
        ),
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>OfferForm()));
        },
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

        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          onTap: (){
            passData(snapshot[index]);
          },
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.network(snapshot[index].data['imageURL'] ,fit: BoxFit.fitWidth,),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(snapshot[index].data['title'],style: TextStyle(fontFamily: 'nunito', fontSize: 18,fontWeight: FontWeight.bold),),

                  Text(snapshot[index].data['price'].toString() +'  DH/Month',style: TextStyle(color: Colors.deepOrange,fontSize: 16),),
                  SizedBox(height: 6.0),
                  Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child: Icon(Icons.location_on, size: 16.0, color: Colors.grey,)
                    ),
                    TextSpan(
                        text: snapshot[index].data['city']
                    )
                  ]), style: TextStyle(color: Colors.grey, fontSize: 15.0),)
                ],
              ),
            ),
          ],
        ),
        )
      ),
    );

    return cards;
  }
}