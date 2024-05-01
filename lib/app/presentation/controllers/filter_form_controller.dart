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

  int get activeFiltersAmount => [
        selectedTemplate != null ? 1 : 0,
        selectedStreet != null ? 1 : 0,
        selectedCity != null ? 1 : 0,
        selectedSystem != null ? 1 : 0
      ].reduce((value, element) => value + element);
  
}
