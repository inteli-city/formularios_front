import 'package:formularios_front/app/domain/entities/form_entity.dart';
import 'package:intl/intl.dart';

class FormController {
  final FormEntity form;

  FormController({required this.form});

  String get creationDate => DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(form.creationDate, isUtc: true));

  String get expirationDate => DateFormat('dd/MM/yyyy HH:mm:ss').format(
      DateTime.fromMillisecondsSinceEpoch(form.expirationDate, isUtc: true));

  bool isSendingForm = false;

  void setIsSendingForm(bool value) {
    isSendingForm = value;
  }

  bool getIsSendingForm() => isSendingForm;

  void setFieldValue(String sectionId, String key, dynamic value) {
    var field = form.sections
        .firstWhere((section) => section.sectionId == sectionId)
        .fields
        .firstWhere((field) => field.key == key);
    field.value = value;
  }

  dynamic getFieldValue(String sectionId, String key) {
    return form.sections
        .firstWhere((section) => section.sectionId == sectionId)
        .fields
        .firstWhere((field) => field.key == key)
        .value;
  }
}
