import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/models/Offer.dart';
import 'package:test_app/notifiers/offer_notifier.dart';


class OfferForm extends StatefulWidget {
  @override
  _OfferFormState createState() => _OfferFormState();
}

class _OfferFormState extends State<OfferForm> {
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  List _equipments=[];
  Offer _currentOffer;
  Widget _showImage(){
    return Text('Image Here');
  }
  Widget _buildTitleField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'title'),
      initialValue: _currentOffer.title,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is required';
        }
        if (value.length < 3 || value.length > 20) {
          return 'Title must be more than 3 and less than 20';
        }
        return null;
      },
      onSaved: (String value) {
        _currentOffer.title = value;
      },
    );
  }
  Widget _buildEquipmentsField(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Equipments'),
      initialValue: _currentOffer.equipments,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Equipments is required';
        }
        if (value.length < 3 || value.length > 20) {
          return 'Equipments must be more than 3 and less than 20';
        }
        return null;
      },
      onSaved: (String value) {
        _currentOffer.equipments = value;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer Form '),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formkey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              _showImage(),
              SizedBox(height: 16,),
              Text('Create Offer',textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
              SizedBox(height: 16,),
              RaisedButton(
                onPressed: (){

                },
                color: Colors.orangeAccent,
                child: Text('Add Image',style: TextStyle(color: Colors.white),),
              ),
              _buildTitleField(),
              _buildEquipmentsField()
            ],
          ),
        ),
      ),
    );
  }
}
