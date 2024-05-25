import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';

class FormController {
  List<SectionEntity> sections;
  List<FormSectionController> sectionControllers = [];
  Map<String, dynamic> formData = {};

  FormController({required this.sections, required this.sectionControllers}) {
    initializeFormData();
  }

  void initializeFormData() {
    for (var section in sections) {
      initializeSectionData(section);
    }
  }

  void initializeSectionData(SectionEntity section) {
    formData[section.sectionId] = {};
    for (var field in section.fields) {
      formData[section.sectionId][field.key] = null;
    }
  }

  void saveSectionData(String sectionId, Map<String, dynamic> sectionData) {
    if (formData.containsKey(sectionId)) {
      formData[sectionId] = sectionData;
    } else {
    }
  }

  Map<String, dynamic> getFormData() {
    return formData;
  }

  void saveForm() {
    for (var section in sections) {
      saveSectionData(section.sectionId, formData[section.sectionId]);
    }


  }
}
