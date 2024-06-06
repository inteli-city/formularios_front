import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:intl/intl.dart';

class FormController {
  final FormEntity form;

  FormController({required this.form}) {
    setData();
  }

  void setData() {
    for (SectionEntity section in form.sections) {
      formData[section.sectionId] = {};
    }
  }

  String get creationDate => DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(form.creationDate, isUtc: true));

  String get expirationDate => DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(form.expirationDate, isUtc: true));

  bool isSendingForm = false;
  Map<String, dynamic> formData = {};

  void setIsSendingForm(bool value) {
    isSendingForm = value;
  }

  bool getIsSendingForm() => isSendingForm;

  void setFieldValue(String sectionId, String key, dynamic value) {
    formData[sectionId][key] = value;
  }

  dynamic getFieldValue(String sectionId, String key, dynamic value) {
    return formData[sectionId][key];
  }
}
