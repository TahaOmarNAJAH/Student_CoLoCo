import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DemandForm extends StatefulWidget {
  @override
  _DemandFormState createState() => _DemandFormState();
}

class _DemandFormState extends State<DemandForm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController _titleController = TextEditingController();
  TextEditingController _maxBudgetController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer Form '),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add New Demand',
                  style: TextStyle(
                      fontFamily: 'nunito',
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    hintText: 'Enter Title Here',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _maxBudgetController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Max Budget',
                    hintText: 'Enter Max Budget',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 5,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    hintText: 'Enter OutlineInputBorder Here',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                OutlineButton(
                  onPressed: saveData,
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void saveData() async{
    var currentUser=await FirebaseAuth.instance.currentUser();
    print(currentUser);
    Firestore.instance.collection('retalDemandes').document().setData({
      'title':_titleController.text,
      'max_budget':double.parse(_maxBudgetController.text),
      'description':_descriptionController.text,
      'user':{
        'uid':currentUser.uid,
        'email':currentUser.email,

      }
    });
    _maxBudgetController.clear();
    _descriptionController.clear();
    _titleController.clear();
  }
}
