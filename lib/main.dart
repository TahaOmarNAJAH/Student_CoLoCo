import 'package:flutter/material.dart';
import 'package:test_app/notifiers/auth_notifier.dart';
import 'loginScreen.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }

}