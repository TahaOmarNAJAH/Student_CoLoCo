import 'package:flutter/material.dart';

class OffertDetails extends StatefulWidget{
  @override
  _OffertDetailsState createState() => _OffertDetailsState();
}

class _OffertDetailsState extends State<OffertDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demands Page'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text('test'),
      ),
    );
  }
}