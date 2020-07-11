import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:test_app/pages/demandDetails.dart';
import 'package:test_app/pages/demand_form.dart';

class Demands extends StatefulWidget{
  @override
  _DemandsPageState createState() => _DemandsPageState();
}

class _DemandsPageState extends State<Demands> {
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
  passData(DocumentSnapshot snap){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>DemandDetails(snapshot: snap,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: Icon(
          Icons.add,color: Colors.white,
        ),
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>DemandForm()));
        },
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
              child: GestureDetector(
                onTap: (){
                  passData(snapshot[index]);
                },
                child:
                Card(
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
                        Text(snapshot[index].data['description'],style: TextStyle(fontSize: 15,fontFamily: 'nunito'),maxLines: 2,),
                        const SizedBox(height: 5.0),
                        Text("Max Budget :".toUpperCase(), style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0
                        )),
                        Text(snapshot[index].data['max_budget'].toString()+"DH", style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                      ],
                    ),
                  ),
                ),
              )
          ),
        )
    );
  }

}