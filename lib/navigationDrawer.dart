import 'package:flutter/material.dart';
import 'package:test_app/pages/demandsPage.dart';
import 'package:test_app/pages/offersPage.dart';
import 'package:test_app/pages/mapPage.dart';
import 'package:test_app/pages/login.dart';
import 'package:test_app/pages/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/pages/register_form.dart';
import 'package:test_app/pages/demand_form.dart';
import 'package:test_app/pages/offerForm.dart';

class NavigationDrawer extends StatefulWidget{
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
   return Drawer(
     child: ListView(
       children: <Widget>[
         UserAccountsDrawerHeader(
           accountName: new Text('omar',style: TextStyle(fontSize: 18 ,),),
           accountEmail: new Text('omar@gmail.com'),
           decoration: BoxDecoration(
               gradient: LinearGradient(
                   begin: Alignment.topRight,
                   end: Alignment.bottomLeft,
                   stops: [
                     0.1,
                     0.9
                   ],
                   colors: [
                     Colors.amberAccent,
                     Colors.orangeAccent
                   ])
           ),
         ),
         ListTile(
           title: Text('Offers',style: TextStyle(fontSize: 15),),
           leading: Icon(Icons.local_offer,color: Colors.teal,),
           onTap: (){
             Navigator.of(context).pop();
             Navigator.push(context, MaterialPageRoute(builder: (context)=>OffersPage()));
           },
         ),
         ListTile(
           title: Text('Demands',style: TextStyle(fontSize: 15),),
           leading: Icon(Icons.widgets,color: Colors.teal,),
           onTap: (){
             Navigator.of(context).pop();
             Navigator.push(context, MaterialPageRoute(builder: (context)=>DemandsPage()));
           },
         ),
         ListTile(
           title: Text('Map',style: TextStyle(fontSize: 15),),
           leading: Icon(Icons.map,color: Colors.teal,),
           onTap: (){
             Navigator.of(context).pop();
             Navigator.push(context, MaterialPageRoute(builder: (context)=>MapPage()));
           },
         ),
         Divider(color: Colors.teal,),
         ListTile(
           title: Text('Add New Offer',style: TextStyle(fontSize: 15),),
           leading: Icon(Icons.add,color: Colors.teal,),
           onTap: (){
             Navigator.of(context).pop();
             Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferForm()));
           },
         ),
         ListTile(
           title: Text('Add New Demand',style: TextStyle(fontSize: 15),),
           leading: Icon(Icons.add,color: Colors.teal,),
           onTap: (){
             Navigator.of(context).pop();
             Navigator.push(context, MaterialPageRoute(builder: (context)=>DemandForm()));
           },
         ),
         ListTile(
           title: Text('Map',style: TextStyle(fontSize: 15),),
           leading: Icon(Icons.map,color: Colors.teal,),
         ),
         ListTile(
           title: Text('login',style: TextStyle(fontSize: 15),),
           leading: Icon(Icons.info,color: Colors.teal,),
           onTap: (){
             Navigator.of(context).pop();
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
           },
         ),
         ListTile(
           title: Text('Register',style: TextStyle(fontSize: 15),),
           leading: Icon(Icons.info,color: Colors.teal,),
           onTap: (){
             Navigator.of(context).pop();
             Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen2()));
           },
         ),
         ListTile(
           title: Text('Sign out',style: TextStyle(fontSize: 15),),
           leading: Icon(Icons.exit_to_app,color: Colors.teal,),
           onTap: (){
            FirebaseAuth.instance.signOut().then((vallue){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
            });
           },
         ),

       ],
     ),
   );
  }
}