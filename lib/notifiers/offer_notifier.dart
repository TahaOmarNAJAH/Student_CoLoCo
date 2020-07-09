import 'package:test_app/models/Offer.dart';
import 'package:flutter/cupertino.dart';
import 'dart:collection';

class OfferNotifier with ChangeNotifier {
  List<Offer> _offerList = [];
  Offer _currentOffer;

  UnmodifiableListView<Offer> get offerList => UnmodifiableListView(_offerList);

  Offer get currentOffer => _currentOffer;

  set offerList(List<Offer> offerList) {
    _offerList = offerList;
    notifyListeners();
  }

  set currentOffer(Offer offer) {
    _currentOffer = offer;
    notifyListeners();
  }
  addOffer(Offer offer) {
    _offerList.insert(0, offer);
    notifyListeners();
  }




}
