import 'package:flutter/material.dart';
import 'package:formularios_front/app/domain/entities/form_entity.dart';

class FilteredDataProvider extends ChangeNotifier {
  List<FormEntity> _filteredForms = [];

  void setFilteredForms(List<FormEntity> filteredForms) {
    _filteredForms = filteredForms;
    notifyListeners();
  }

  List<FormEntity> get filteredForms => _filteredForms;
}