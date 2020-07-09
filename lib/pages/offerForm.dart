import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/models/Offer.dart';
import 'package:test_app/notifiers/offer_notifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class OfferForm extends StatefulWidget {
  @override
  _OfferFormState createState() => _OfferFormState();
}

class _OfferFormState extends State<OfferForm> {
  File _imageFile=null;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Offer Form '),
        backgroundColor: Colors.orangeAccent,
      ),
      body:isLoading? Center(
        child: CircularProgressIndicator(),
      )
      :Column(
        children: <Widget>[
          Center(
            child: _imageFile== null
            ? Text('no image choosen'):
            Image.file(_imageFile),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: pickImage,
                  child: Text('upload'),
                ),
                FlatButton(
                  onPressed: uploadImage,
                  child: Text('Save'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Future pickImage() async{
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile=file;
    });
  }
  void uploadImage() async{
    setState(() {
      isLoading=true;
    });
    //FirebaseStorage storage = FirebaseStorage(storageBucket: 'gs://student-coloco-9aa8a.appspot.com');
    StorageReference reference=await FirebaseStorage().ref().child("offersImages");
    StorageUploadTask storageUploadTask = await reference.child("stat_"+DateTime.now().toIso8601String()).putFile(_imageFile);
    StorageTaskSnapshot storageTaskSnapshot=await storageUploadTask.onComplete;
    var dowloadURL=await storageTaskSnapshot.ref.getDownloadURL();
    print("dowloadURL $dowloadURL");
    setState(() {
      isLoading=false;
    });

  }
}
