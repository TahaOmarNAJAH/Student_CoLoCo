import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/pages/login.dart';

class RegisterScreen extends StatefulWidget{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void initState()
  {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _firstnamecontroller = TextEditingController();

  TextEditingController _lastnamecontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _phonenumbercontroller = TextEditingController();



  @override
  void dispose()
  {
    _firstnamecontroller.dispose();

    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    _phonenumbercontroller.dispose();

    _lastnamecontroller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
          title: Text('Register'),
          backgroundColor: Colors.orangeAccent,
        ),
      body:SingleChildScrollView(
      child:
      Container(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Create Account',
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
                controller: _firstnamecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First name',
                  hintText: 'Enter First Name Here',
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
                controller: _lastnamecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last name',
                  hintText: 'Enter Last Name Here',
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
                controller: _phonenumbercontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  hintText: 'This field cannot be left blank',
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
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Email Here',
                ),
                validator: (item) {
                  return item.contains("@")
                      ? null
                      : "Enter valid Email";
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password Here',
                ),
                validator: (item) {
                  return item.length > 6
                      ? null
                      : "Password must be 6 characters";
                },
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                height: 50,
                child: OutlineButton(
                  onPressed: saveData,
                  child: Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
  void saveData() async{
    if(_formkey.currentState.validate()){
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
      if(result != null)
      {
        Firestore.instance.collection('users').document(result.user.uid).setData({
          'firstname':_firstnamecontroller.text,
          'lastname':_lastnamecontroller.text,
          'phone_number':_phonenumbercontroller.text,
        });

        _phonenumbercontroller.clear();
        _lastnamecontroller.clear();
        _firstnamecontroller.clear();
        _emailcontroller.clear();
        _passwordcontroller.clear();

        Fluttertoast.showToast(msg: "User Created successfully",backgroundColor: Colors.orange,textColor:Colors.white).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
        });
      }else{
        Fluttertoast.showToast(msg: "please try later",backgroundColor: Colors.orange,textColor:Colors.white);
      }
    }
  }


}