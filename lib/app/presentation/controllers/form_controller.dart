import 'package:formularios_front/app/domain/entities/section_entity.dart';

class FormController {
  List<SectionEntity> sections;
  bool isSendingForm = false;
  Map<String, dynamic> formData = {};
  FormController({required this.sections}) {
    initFormData();
  }

  void setIsSendingForm(bool value) {
    isSendingForm = value;
  }

  bool getIsSendingForm() => isSendingForm;

  void initFormData() {
    for (SectionEntity section in sections) {
      formData[section.sectionId] = {};
    }
  }

  void setFieldValue(String sectionId, String key, dynamic value) {
    formData[sectionId][key] = value;
  }

  dynamic getFieldValue(String sectionId, String key, dynamic value) {
    return formData[sectionId][key];
  }

  void sendForm() {
    print(formData);
  }
}
