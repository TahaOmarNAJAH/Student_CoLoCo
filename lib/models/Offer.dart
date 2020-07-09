import 'package:cloud_firestore/cloud_firestore.dart';

class Offer{
  String id;
  String title;
  double price;
  String imageURL;
  int houseCapacity;
  String city;
  int houseArea;
  String description;
  String accommodationAddress;
  int roomNumber;
  String equipments;
  Timestamp createdAt;
  Timestamp updatedAt;

  Offer(
      this.id,
      this.title,
      this.price,
      this.imageURL,
      this.houseCapacity,
      this.city,
      this.houseArea,
      this.description,
      this.accommodationAddress,
      this.roomNumber,
      this.equipments,
      this.createdAt,
      this.updatedAt,
      );


  Offer.map(dynamic obj){
    this.id=obj['id'];
    this.accommodationAddress=obj['accommodation_address'];
    this.city=obj['city'];
    this.description=obj['description'];
    this.houseArea=obj['house_area'];
    this.houseCapacity=obj['house_capacity'];
    this.imageURL=obj['imageURL'];
    this.price=obj['price'];
    this.roomNumber=obj['room_number'];
    this.title=obj['title'];
    this.equipments=obj['equipments'];
    this.createdAt=obj['createdAt'];
    this.createdAt=obj['updatedAt'];
  }

  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map['id'] = id;
    map['accommodation_address'] = accommodationAddress;
    map['city']= city;
    map['description']=description;
    map['house_area']=houseArea;
    map['house_capacity']=houseCapacity;
    map['imageURL']=imageURL;
    map['price']=price;
    map['room_number']=roomNumber;
    map['title']=title;
    map['createdAt']=createdAt;
    map['updatedAt']=updatedAt;
    return map;
  }
  Offer.fromMap(Map<String,dynamic>map){
    this.id=map['id'];
    this.accommodationAddress=map['accommodation_address'];
    this.city=map['city'];
    this.description=map['description'];
    this.houseArea=map['house_area'];
    this.houseCapacity=map['house_capacity'];
    this.imageURL=map['imageURL'];
    this.price=map['price'];
    this.roomNumber=map['room_number'];
    this.title=map['title'];
    this.createdAt=map['createdAt'];
    this.updatedAt=map['updatedAt'];
  }

}