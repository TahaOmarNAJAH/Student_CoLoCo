import 'package:cloud_firestore/cloud_firestore.dart';

class MapLocations{
  String _id;
  String _dbId;
  String _latitude;
  String _longitude;
  String _description;
  String _title;
  String _price;

  MapLocations(this._id, this._dbId, this._latitude, this._longitude,
      this._description, this._title, this._price);

  MapLocations.map(dynamic obj){
    this._id=obj['id'];
    this._dbId=obj['dbId'];
    this._latitude=obj['latitude'];
    this._longitude=obj['longitude'];
    this._description=obj['description'];
    this._title=obj['title'];
    this._price=obj['price'];
  }


}