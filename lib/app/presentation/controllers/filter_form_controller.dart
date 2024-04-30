class FilterFormController {
  String? selectedTemplate;

  String? selectedStreet;

  String? selectedCity;

  String? selectedSystem;

  void setTemplate(String? value) {
    selectedTemplate = value;
  }

  void setStreet(String? value) {
    selectedStreet = value;
  }

  void setCity(String? value) {
    selectedCity = value;
  }

  void setSystem(String? value) {
    selectedSystem = value;
  }

  void clearFilters() {
    selectedTemplate = null;
    selectedStreet = null;
    selectedCity = null;
    selectedSystem = null;
  }
}
