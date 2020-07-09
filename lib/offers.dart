import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Offers extends StatefulWidget{
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('offers'),
      ),
    );
  }
}