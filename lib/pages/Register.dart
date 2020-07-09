import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/pages/Register.dart';
import 'package:test_app/home.dart';
import 'package:test_app/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _email, _password;
  var _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register '),
        backgroundColor: Colors.orangeAccent,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),))
          : Container(
        margin: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: SingleChildScrollView(

          child:Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (item) {
                    return item.contains("@")
                        ? null
                        : "Enter valid Email";
                  },
                  onChanged: (item) {
                    setState(() {
                      _email = item;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      labelText: "Email",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (item) {
                    return item.length > 6
                        ? null
                        : "Password must be 6 characters";
                  },
                  onChanged: (item) {
                    setState(() {
                      _password = item;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.orangeAccent,
                    onPressed: () {
                      signup();
                    },
                    child: Text('Register',style: TextStyle(fontSize: 20),),
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) =>  Login()));
                    },
                    child: Text("Login here")),alignment: Alignment.centerRight,)
              ],
            )),
        )
      ),
    );
  }

  void signup() {
    if (_formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        // sign up
        setState(() {
          isLoading = false;
        });

        Fluttertoast.showToast(msg: "Register Success");

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Home()),
                (Route<dynamic> route) => false);
      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "error " + onError.toString());
      });
    }
  }
}
