import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/pages/demandsPage.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
  var _chosenValue='Bénimellal';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Demand'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: _formkey,
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
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field cannot be left blank';
                    }
                    // return 'Valid Name';
                  },
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
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field cannot be left blank';
                    }
                    // return 'Valid Name';
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _chosenValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  decoration: InputDecoration(
                    labelText: "Select City",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  items: <String>['Bénimellal', 'Marrakesh', 'Rabat', 'Tanger']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value){
                    _chosenValue=value;
                  },
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
                    hintText: 'Enter Description Here',
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'This field cannot be left blank';
                    }
                    // return 'Valid Name';
                  },
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
    if(_formkey.currentState.validate()) {
      var currentUser = await FirebaseAuth.instance.currentUser();
      print(currentUser);
      Firestore.instance.collection('retalDemandes').document().setData({
        'title': _titleController.text,
        'max_budget': double.parse(_maxBudgetController.text),
        'description': _descriptionController.text,
        'city': _chosenValue,
        'user': {
          'uid': currentUser.uid,
          'email': currentUser.email,

        }
      });
      _maxBudgetController.clear();
      _descriptionController.clear();
      _titleController.clear();

      Fluttertoast.showToast(msg: "Demand Created successfully",backgroundColor: Colors.orange,textColor:Colors.white ).then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DemandsPage()));
      });
    }else{
      Fluttertoast.showToast(msg: "Please try Laster",backgroundColor: Colors.orange,textColor:Colors.white);
    }
  }
}
