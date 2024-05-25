class FormSectionController {
  final Map<String, dynamic> _fieldValues = {};

  FormSectionController();

  void setFieldValue(String key, dynamic value) {
    _fieldValues[key] = value;
  }

  dynamic getFieldValue(String key) {
    return _fieldValues[key];
  }

  Map<String, dynamic> get fieldValues => _fieldValues;
}
