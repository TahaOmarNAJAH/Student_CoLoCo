class Offer{
  String _title;
  double _price;
  String _imageURL;
  int _houseCapacity;
  String _city;
  int _houseArea;
  String _description;
  String _accommodationAddress;
  int _roomNumber;

  Offer(
      this._title,
      this._price,
      this._imageURL,
      this._houseCapacity,
      this._city,
      this._houseArea,
      this._description,
      this._accommodationAddress,
      this._roomNumber);

  Offer.map(dynamic obj){
    this._accommodationAddress=obj['accommodation_address'];
    this._city=obj['city'];
    this._description=obj['description'];
    this._houseArea=obj['house_area'];
    this._houseCapacity=obj['house_capacity'];
    this._imageURL=obj['imageURL'];
    this._price=obj['price'];
    this._roomNumber=obj['room_number'];
    this._title=obj['title'];
  }

}