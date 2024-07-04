import 'package:flutter/material.dart';

class CreateFormController extends ChangeNotifier {
  double? latitude;

  double? longitude;

  String? city;

  String? street;

  int? number;

  void setAdress(double latitude, double longitude, String city, String street,
      int number) {
    this.latitude = latitude;
    this.longitude = longitude;
    this.city = city;
    this.street = street;
    this.number = number;
    notifyListeners();
  }
}
