import 'package:flutter/material.dart';

class SelectedFilterDataProvider extends ChangeNotifier {
  Map<String, String?> selectedValues = {
    'template': null,
    'street': null,
    'region': null,
    'city': null,
    'system': null,
    "priority": null,
    "creationDate": null
  };
  void setState() {
    notifyListeners();
  }

  void updateSelectedValues(Map<String, String?> newValues) {
    selectedValues = newValues;
    setState();
  }
}
