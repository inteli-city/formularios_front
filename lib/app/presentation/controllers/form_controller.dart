import 'package:formularios_front/app/domain/entities/section_entity.dart';
import 'package:formularios_front/app/presentation/controllers/form_section_controller.dart';
import 'package:formularios_front/app/shared/helpers/functions/global_snackbar.dart';

class FormController {
  List<SectionEntity> sections;
  List<FormSectionController> sectionControllers = [];
  List<bool> areSectionsSaved;

  Map<String, dynamic> formData = {};

  FormController({required this.sections, required this.sectionControllers})
      : areSectionsSaved = List.filled(sections.length, false) {
    for (var section in sections) {
      initializeSectionData(section: section);
    }
  }

  void initializeSectionData({required SectionEntity section}) {
    formData[section.sectionId] = {};
    for (var field in section.fields) {
      formData[section.sectionId][field.key] = null;
    }
  }

  void saveSectionData(
      {required String sectionId, required Map<String, dynamic> sectionData}) {
    if (formData.containsKey(sectionId)) {
      formData[sectionId] = sectionData;
    }
    setSectionAsSaved(sectionId: sectionId);
  }

  Map<String, dynamic> getFormData() {
    return formData;
  }

  void sendForm() {
    if (areSectionsSaved.contains(false)) {
      GlobalSnackBar.error(
          "Todas as secões devem ser salvas antes de enviar o formulário");
    } else {
      GlobalSnackBar.success("Formulário enviado com sucesso!");
    }
  }

  void setSectionAsSaved({required String sectionId}) {
    int sectionIndex =
        sections.indexWhere((section) => section.sectionId == sectionId);
    if (sectionIndex != -1) {
      areSectionsSaved[sectionIndex] = true;
    }
  }
}
