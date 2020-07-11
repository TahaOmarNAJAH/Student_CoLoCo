import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:test_app/pages/offersPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OfferForm extends StatefulWidget {
  @override
  _OfferFormState createState() => _OfferFormState();
}

class _OfferFormState extends State<OfferForm> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _roomNumberController = TextEditingController();
  TextEditingController _houseCapacityController = TextEditingController();
  TextEditingController _houseAreaController = TextEditingController();
  TextEditingController _equipmentsController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();

  File _imageFile = null;
  bool isLoading = false;
  var _chosenValue = 'Bénimellal';

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _addressController.dispose();
    _roomNumberController.dispose();
    _houseCapacityController.dispose();
    _houseAreaController.dispose();
    _equipmentsController.dispose();
    _descriptionController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Offer Form '),
          backgroundColor: Colors.orangeAccent,
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),),
              )
            : SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(30.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Add New Offer',
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
                            validator: (item) {
                              return item.isNotEmpty
                                  ? null
                                  : "This field cannot be empty";
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _priceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Price',
                              hintText: 'Enter Price Here',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be left blank';
                              }
                              // return 'Valid Name';
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _houseCapacityController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Capacity',
                              hintText: 'Enter Capacity Here',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be left blank';
                              }
                              // return 'Valid Name';
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _roomNumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Rooms Number',
                              hintText: 'Enter Rooms Number Here',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _houseAreaController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'House Area',
                              hintText: 'Enter The house Area Here',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _equipmentsController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Equipments',
                              hintText: 'Enter The Equipments Here',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
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
                            items: <String>[
                              'Bénimellal',
                              'Marrakesh',
                              'Rabat',
                              'Tanger'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              _chosenValue = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Phone Number',
                              hintText: 'Enter Phone Here',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be left blank';
                              }
                              // return 'Valid Name';
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            maxLines: 3,
                            controller: _addressController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Address',
                              hintText: 'Enter Address Here',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be left blank';
                              }
                              // return 'Valid Name';
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            maxLines: 3,
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Description',
                              hintText: 'Enter Description Here',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be left blank';
                              }
                              // return 'Valid Name';
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _latitudeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'latitude',
                              hintText: 'Enter latitude Here',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be left blank';
                              }
                              // return 'Valid Name';
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _longitudeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'longitude',
                              hintText: 'Enter longitude Here',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field cannot be left blank';
                              }
                              // return 'Valid Name';
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          OutlineButton(
                            child: Text('Choose Image'),
                            onPressed: pickImage,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: _imageFile == null
                                ? Text(
                                    'No Image Selected',
                                    textAlign: TextAlign.center,
                                  )
                                : Image.file(
                                    _imageFile,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          OutlineButton(
                            onPressed: saveData,
                            child: Text('Save'),
                          ),
                        ],
                      ),
                    ))));
  }

  Future pickImage() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = file;
    });
  }

  Future<String> uploadImage() async {
    setState(() {
      isLoading = true;
    });
    //FirebaseStorage storage = FirebaseStorage(storageBucket: 'gs://student-coloco-9aa8a.appspot.com');
    StorageReference reference =
        await FirebaseStorage().ref().child("offersImages");
    StorageUploadTask storageUploadTask = await reference
        .child("stat_" + DateTime.now().toIso8601String())
        .putFile(_imageFile);
    StorageTaskSnapshot storageTaskSnapshot =
        await storageUploadTask.onComplete;
    String dowloadURL = await storageTaskSnapshot.ref.getDownloadURL();
    //print("dowloadURL $dowloadURL");
    setState(() {
      isLoading = false;
    });
    return dowloadURL;
  }

  void saveData() async {
    if (_formkey.currentState.validate()) {
      String dowloadURL = await uploadImage();
      print("dowloadURL $dowloadURL");
      var currentUser = await FirebaseAuth.instance.currentUser();
      print(currentUser);
      Firestore.instance.collection('rentalOffers').document().setData({
        'title': _titleController.text,
        'room_number': int.parse(_roomNumberController.text),
        'description': _descriptionController.text,
        'imageURL': dowloadURL,
        'house_capacity': int.parse(_houseCapacityController.text),
        'house_area': int.parse(_houseCapacityController.text),
        'equipments': _equipmentsController.text,
        'phone':int.parse(_phoneController.text),
        'accommodation_address': _addressController.text,
        'city': _chosenValue,
        'price': double.parse(_priceController.text),
        'location':new GeoPoint(double.parse(_latitudeController.text), double.parse(_longitudeController.text)),
        'user': {
          'uid': currentUser.uid,
          'email': currentUser.email,
        }
      });
      _titleController.clear();
      _descriptionController.clear();
      _cityController.clear();
      _priceController.clear();
      _addressController.clear();
      _equipmentsController.clear();
      _houseCapacityController.clear();
      _roomNumberController.clear();
      _houseAreaController.clear();
      _phoneController.clear();
      _longitudeController.clear();
      _latitudeController.clear();
      _imageFile = null;
      Fluttertoast.showToast(
              msg: "User Created successfully",
              backgroundColor: Colors.orange,
              textColor: Colors.white)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OffersPage()));
      });
    } else {
      Fluttertoast.showToast(
          msg: "Please try Laster",
          backgroundColor: Colors.orange,
          textColor: Colors.white);
    }
  }
}
