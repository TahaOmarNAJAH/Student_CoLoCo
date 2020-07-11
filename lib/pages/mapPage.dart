import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:test_app/pages/offer_details.dart';
import 'package:test_app/models/Offer.dart';


class MapPage extends StatefulWidget{
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  StreamSubscription<QuerySnapshot>subscription;
  List<DocumentSnapshot>snapshot;
  CollectionReference collectionReference=Firestore.instance.collection("rentalOffers");
  List<Marker> markers=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription=collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot=datasnapshot.documents;
      });
    });
    createMarkers();
  }

  Future createMarkers () async{
    Firestore.instance.collection('rentalOffers').getDocuments().then((docs){
      if(docs.documents.isNotEmpty){
        for(int i=0;i<docs.documents.length;++i) {
          //print('title:'+docs.documents[i].data['title']);
          if(docs.documents[i].data['location']!=null){
            setState(() {
              markers.add(Marker(
                markerId: MarkerId(docs.documents[i].data['title']),
                draggable: false,
                infoWindow: InfoWindow(title:docs.documents[i].data['title'] ,snippet: docs.documents[i].data['price'].toString()+"DH" , onTap:(){
                  passData(snapshot[i]);
                }),
                position: LatLng(docs.documents[i].data['location'].latitude,docs.documents[i].data['location'].longitude),

              ));
            });

            print( docs.documents[i].data['location'].latitude);
          }
        }
      }
    });
  }
  passData(DocumentSnapshot snap){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>OfferDetailsPage(snapshot: snap,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(32.336998652, -6.356498574),
                zoom: 13,
              ),
              markers: Set.from(markers),
            ),
          ]
      ),
    );
  }

}